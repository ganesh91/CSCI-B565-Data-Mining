package datamining;

import org.ejml.simple.SimpleMatrix;

public class Cluster {
	public int clusterID;
	public SimpleMatrix clusterCenter;
	public SimpleMatrix clusterPrevious;
	public int[] currPoints;
	public int[] prevPoints;
	public boolean hasChanged;
	public int[] intIndex;
	public int noPoints;
	public Cluster(int clusterID,SimpleMatrix clusterCenter,SimpleMatrix prevPoints,int[] currPoints,int[] intIndex) {
		this.clusterID=clusterID;
		this.clusterCenter=clusterCenter;
		this.currPoints=currPoints;
		hasChanged=false;
		this.intIndex=intIndex;
		this.clusterPrevious=prevPoints;
	}

	public void backup(){
		clusterPrevious=clusterCenter.copy();
		prevPoints=currPoints;
	}
	
	public void flipFlag(boolean status){
		this.hasChanged=status;
	}
	

}
