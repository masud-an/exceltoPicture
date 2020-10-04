#include <iostream>
#include <string>
#include <fstream>

int main()
{
    using namespace std;
    int i,j;
    int CountOn;
    int matrixSize;

    cout << "Enter The Size of Row-Column= ";
    cin >> matrixSize;

    CountOn = matrixSize * matrixSize;

    ifstream file("allHexValues.txt");

    ofstream fOutput("PictureGrid.txt");

    string myArray[CountOn];

    string myArrayMatrix[matrixSize][matrixSize];

    if(file.is_open())
    {


        for( i = 0; i < CountOn; i++)
        {
            file >> myArray[i];
        }
    }


    for (i = 0; i < matrixSize; i++)
    {
        for ( j = 0; j < matrixSize; j++ )
        {
            myArrayMatrix[i][j] = myArray[i*matrixSize + j];
        }
    }

    for (i = 0; i < matrixSize; i++)
    {
        for ( j = 0; j < matrixSize; j++ )
        {
            fOutput << myArrayMatrix[j][i];
            fOutput << ",";
        }
        fOutput << " \n";
    }



    cout << "Program End";

    return 0;
}
