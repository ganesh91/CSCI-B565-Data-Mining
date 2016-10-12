package datamining;

import org.ejml.simple.SimpleMatrix;

public class MatrixTest {

	public MatrixTest() {
		// TODO Auto-generated constructor stub
	}
	
	
	public static void main(String args[]){
		try{
		SimpleMatrix dataSet = new SimpleMatrix().loadCSV("D:\\makeup.csv");
		dataSet.print();
		System.out.println(dataSet.extractVector(false,1));
		System.out.println(dataSet.get(9,1));
		}
		catch (Exception e){
			e.printStackTrace();
		}
	}
}
