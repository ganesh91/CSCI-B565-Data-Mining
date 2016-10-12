package datamining; 
import java.beans.FeatureDescriptor;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.ListIterator;
import java.util.Random;

import javax.sound.midi.Synthesizer;

import datamining.Cluster;
import org.ejml.simple.SimpleMatrix;

public class KMeans {

	public KMeans() {
		// TODO Auto-generated constructor stub
	}

	public static int genRandom(int start,int end){
		//http://stackoverflow.com/questions/7961788/math-random-explained
		int range=(end-start)+1;
		return (int)(Math.random()*range)+start;
	}
	
	public static void printKCentroids(List<Cluster> kCentroids){
		ListIterator<Cluster> itr = kCentroids.listIterator();
		while(itr.hasNext()){
			Cluster center=itr.next();
			System.out.println("Cluster Id : "+center.clusterID);
			System.out.println("Cluster Centers : " + center.clusterCenter.extractVector(true, 0));
			System.out.println("Previous Centers : " + center.clusterPrevious.extractVector(true, 0));
			int[] centerPoints=new int[center.noPoints];
			for(int i=0;i<center.noPoints;i++){
				centerPoints[i]=center.currPoints[i];
			}
			System.out.println("Cluster Points"+Arrays.toString(centerPoints));
			//center.clusterPrevious.print();
			System.out.println("Cluster Internal Indexes"+Arrays.toString(center.intIndex)+"\n");
		}
	}
	
	public static SimpleMatrix compDist(List<Cluster> kCentroids,SimpleMatrix dataSet,int[] featureSet,String distanceMetric){
		int dRows = dataSet.numRows();
		int dCols = kCentroids.size();
		int[] features = featureSet;
		SimpleMatrix distMatrix = new SimpleMatrix(dRows,dCols);
		for(int iCentroid=0;iCentroid<dCols;iCentroid++){
			Cluster kcenter=kCentroids.get(iCentroid);
			for(int iRows=0;iRows<dRows;iRows++){
				double distTemp=0;
				for(int iFeature=0;iFeature<features.length;iFeature++){
					double cX=kcenter.clusterCenter.get(0,features[iFeature]);
					double dX=dataSet.get(iRows, features[iFeature]);
					distTemp=distTemp+Math.pow(cX-dX, 2);
				}
				distMatrix.set(iRows, iCentroid, Math.sqrt(distTemp));
			}
		}
		return distMatrix;
	}
	
	public static List<Cluster> ReassignCentrids(List<Cluster> kCentroids,SimpleMatrix distanceMatrix,SimpleMatrix dataSet,int[] featureSet){
		List<Cluster> kCentroids_l = kCentroids;
		int[] clusterLoc = new int[dataSet.numRows()];
		for(int iRows=0;iRows<dataSet.numRows();iRows++){
			int clusterNo=1;
			double minvalue=distanceMatrix.get(iRows,1);
			for(int iCentroid=0;iCentroid<kCentroids_l.size();iCentroid++){
				//System.out.println(iRows+" "+iCentroid);
				if (distanceMatrix.get(iRows,iCentroid)<minvalue){
					clusterNo=iCentroid;
					minvalue=distanceMatrix.get(iRows,iCentroid);
				}
			}
			clusterLoc[iRows]=clusterNo;
		}
		//Backup Centroids anc clear current centroids
		for (int i=0;i<kCentroids_l.size();i++){
			kCentroids_l.get(i).backup();
			kCentroids_l.get(i).noPoints=0;
			Arrays.fill(kCentroids_l.get(i).currPoints, -1);
			Arrays.fill(kCentroids_l.get(i).intIndex, -1);
			//System.out.println("Clusters Backed Up!");
		}
		//printKCentroids(kCentroids_l);		
		for(int i=0;i<clusterLoc.length;i++){
			int insLoc = kCentroids_l.get(clusterLoc[i]).noPoints;
			//System.out.println("Getting element"+dataSet.get(i, 0));
			kCentroids_l.get(clusterLoc[i]).currPoints[insLoc]=(int)dataSet.get(i,0);
			kCentroids_l.get(clusterLoc[i]).intIndex[insLoc]=i;
			kCentroids_l.get(clusterLoc[i]).noPoints++;
		}
		//System.out.println(Arrays.toString(clusterLoc));
		
		//Now Calculate the best representative and give as new centroid values
		for(int i=0;i<kCentroids.size();i++){
			for (int j=0;j<featureSet.length;j++){
				double tempAvg=0;
				int[] travVector = kCentroids_l.get(i).intIndex;
				for(int k=0;k<travVector.length;k++){
					if (travVector[k] != -1){
						tempAvg=tempAvg+dataSet.get(travVector[k],featureSet[j]);
					}
				}
				kCentroids.get(i).clusterCenter.set(0,featureSet[j],tempAvg/kCentroids.get(i).noPoints);
			}
		}
		return kCentroids_l;
	}
	
	public static boolean detectConvergence(List<Cluster> kCentroids,int[] featureSet,double tolerance){
		int iCentroids=kCentroids.size();
		boolean toReturn=true;
		for(int i=0;i<iCentroids;i++){
			toReturn=true;
			SimpleMatrix current = kCentroids.get(i).clusterCenter.copy();
			SimpleMatrix previous = kCentroids.get(i).clusterPrevious.copy();
			for (int j=0;j<featureSet.length;j++){
				toReturn=true;
				//System.out.println(current.get(0, featureSet[j])+"   "+previous.get(0, featureSet[j])+"   "+Math.abs(Math.abs(current.get(0, featureSet[j])) - Math.abs(previous.get(0, featureSet[j])))+"   "+tolerance*current.get(0, featureSet[j]));
				if(Math.abs(Math.abs(current.get(0, featureSet[j])) - Math.abs(previous.get(0, featureSet[j])))>(tolerance*current.get(0, featureSet[j]))){
					kCentroids.get(i).hasChanged=true;
					//System.out.println("Changes are there");
					break;
				}else{
					kCentroids.get(i).hasChanged=false;
				}
				//System.out.println(kCentroids.get(i).hasChanged);
			}
			//System.out.println(kCentroids.get(i).hasChanged);
			//if(kCentroids.get(i).hasChanged=true) break;
		}
		// Check if I for true
		for (int j=0;j<iCentroids;j++){
			//System.out.println(kCentroids.get(j).hasChanged);
			if(kCentroids.get(j).hasChanged){
				toReturn=false;
				break;
			}
			else{
				toReturn=true;
			}
		}
		//System.out.println("To reyurn"+toReturn);
		return toReturn;
	}
	

	public static void main(String[] args) {
		try{
			if (args.length < 5){
				System.out.println("Invalid Syntax usage. \n The Syntax is KMeans inputfile distance-metric #Centroids #Iterations Tolerance featureSet crossValidation testDataSet");
			}
			String inputFile=args[0];
			String distanceMetric=args[1];
			int centroids=Integer.parseInt(args[2]);
			int iterations=Integer.parseInt(args[3]);
			double tolerance=Double.parseDouble(args[4]);
			String inpFeatures=args[5];
			String crossValidation=args[6];
			String testFile=args[7];
			String[] temp = inpFeatures.split(",");
			int[] featureSet= new int[temp.length];
			boolean hasConvered=false;
			for(int i=0;i<temp.length;i++){
				featureSet[i]=Integer.parseInt(temp[i]);
			}
			System.out.println("Features Considered are"+ Arrays.toString(featureSet));
			SimpleMatrix dataSet = new SimpleMatrix().loadCSV(inputFile);
			
			//Cluster Parameters
			int dsRows = dataSet.numRows();
			int dsCol = dataSet.numCols();
			
			//Cluster Initialization
			List<Cluster> kcentroids = new ArrayList<Cluster>();
			for(int i=0;i<centroids;i++){
				int random = genRandom(0,dsRows-1);
				int[] currPoints = new int[dsRows];
				int[] intIndex = new int[dsRows];
				//This will have remnance of the first chosen element
				Random r = new Random();
				SimpleMatrix t=new SimpleMatrix().random(1, dsCol, 0, 0,r );
				Cluster centers=new Cluster(i,dataSet.extractVector(true, random),t,currPoints,intIndex);
				kcentroids.add(centers);
			}
			
			printKCentroids(kcentroids);
			//dataSet.print();
			SimpleMatrix distMatrix = compDist(kcentroids, dataSet, featureSet, distanceMetric);
			//distMatrix.print();
			//System.out.println(distMatrix.get(0, 1));
			//ReassignCentrids(kcentroids, distMatrix, dataSet,featureSet);
			//printKCentroids(kcentroids);
			for(int k=0;k<iterations;k++){
				System.out.println("------------------------Iteration "+k+" ------------------------");
				distMatrix = compDist(kcentroids, dataSet, featureSet, distanceMetric);
				//distMatrix.print();
				ReassignCentrids(kcentroids, distMatrix, dataSet,featureSet);
				printKCentroids(kcentroids);
				hasConvered=detectConvergence(kcentroids, featureSet, tolerance);
				//System.out.println(hasConvered);
				if (hasConvered){
					System.out.println("------------------------Has Converged : Tolerance------------------------");
					break;					
				}
			}
			if (!hasConvered) System.out.println("------------------------Has Converged : Iterations------------------------");
			if(crossValidation.equals("true")){
				SimpleMatrix test = new SimpleMatrix().loadCSV(testFile);
				SimpleMatrix dist = compDist(kcentroids, test, featureSet, distanceMetric);
				System.out.println("----------Associating Set Data Sets to Calculated Centroid-------");
				dist.print();
				List<Cluster> kCentroids_l = kcentroids;
				int[] clusterLoc = new int[test.numRows()];
				for(int iRows=0;iRows<test.numRows();iRows++){
					int clusterNo=1;
					double minvalue=dist.get(iRows,1);
					for(int iCentroid=0;iCentroid<kCentroids_l.size();iCentroid++){
						//System.out.println(iRows+" "+iCentroid);
						if (dist.get(iRows,iCentroid)<minvalue){
							clusterNo=iCentroid;
							minvalue=dist.get(iRows,iCentroid);
						}
					}
					clusterLoc[iRows]=clusterNo;
				}
				System.out.println(Arrays.toString(clusterLoc));
			}
		}
		catch(Exception e){
			System.out.println("Unfortunately There is an error.");
			e.printStackTrace();
		}

	}

}
