import java.util.*;

public class MatrixMultiplication {
    
    static class MatrixMultiplier implements Runnable {
        private int[][] matrixA;
        private int[][] matrixB;
        private int[][] resultMatrix;
        private int row;
        private int col;
        
        public MatrixMultiplier(int[][] matrixA, int[][] matrixB, int[][] resultMatrix, int row, int col) {
            this.matrixA = matrixA;
            this.matrixB = matrixB;
            this.resultMatrix = resultMatrix;
            this.row = row;
            this.col = col;
        }
        
        @Override
        public void run() {
            int sum = 0;
            for (int i = 0; i < matrixA[row].length; i++) {
                sum += matrixA[row][i] * matrixB[i][col];
            }
            resultMatrix[row][col] = sum;
        }
    }

    public static int[][] multiplyMatrices(int[][] matrixA, int[][] matrixB) {
        int rowsA = matrixA.length;
        int colsA = matrixA[0].length;
        int rowsB = matrixB.length;
        int colsB = matrixB[0].length;

        if (colsA != rowsB) {
            throw new IllegalArgumentException("Number of columns of matrix A must equal number of rows of matrix B.");
        }

        int[][] resultMatrix = new int[rowsA][colsB];
        
        List<Thread> threads = new ArrayList<>();
        
        for (int i = 0; i < rowsA; i++) {
            for (int j = 0; j < colsB; j++) {
                MatrixMultiplier task = new MatrixMultiplier(matrixA, matrixB, resultMatrix, i, j);
                Thread thread = new Thread(task);
                threads.add(thread);
                thread.start();
            }
        }

        for (Thread thread : threads) {
            try {
                thread.join();
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }

        return resultMatrix;
    }

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        
        System.out.println("Enter number of rows for matrix A: ");
        int rowsA = scanner.nextInt();
        System.out.println("Enter number of columns for matrix A: ");
        int colsA = scanner.nextInt();
        
        int[][] matrixA = new int[rowsA][colsA];
        System.out.println("Enter elements of matrix A:");
        for (int i = 0; i < rowsA; i++) {
            for (int j = 0; j < colsA; j++) {
                matrixA[i][j] = scanner.nextInt();
            }
        }

        System.out.println("Enter number of rows for matrix B: ");
        int rowsB = scanner.nextInt();
        System.out.println("Enter number of columns for matrix B: ");
        int colsB = scanner.nextInt();

        int[][] matrixB = new int[rowsB][colsB];
        System.out.println("Enter elements of matrix B:");
        for (int i = 0; i < rowsB; i++) {
            for (int j = 0; j < colsB; j++) {
                matrixB[i][j] = scanner.nextInt();
            }
        }

        int[][] resultMatrix = multiplyMatrices(matrixA, matrixB);

        System.out.println("Result of the multiplication:");
        for (int[] row : resultMatrix) {
            System.out.println(Arrays.toString(row));
        }
        
        scanner.close();
    }
}
