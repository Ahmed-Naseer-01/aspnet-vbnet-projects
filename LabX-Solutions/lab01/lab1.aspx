<%@ Page Language="VB" AutoEventWireup="false" CodeFile="lab1.aspx.vb" Inherits="lab1" %>

<!DOCTYPE html>
<html>
<head>
<style>
table {
  font-family: arial, sans-serif;
  border-collapse: collapse;
  width: 100%;
}

td, th {
  border: 1px solid #dddddd;
  text-align: left;
  padding: 8px;
}

tr:nth-child(even) {
  background-color: #dddddd;
}
</style>
</head>
<body>
<h1>Lab no 01</h1>
            <p> Consider the table shown in Figure 1 and Code Listing 1. Try to solve the following problem?</p>
            <br />
            <p>Write code using C/C++ which performs following tasks:</p>
            <ol>
  <li>Prompt the user to enter number of columns?</li>
  <li>Prompt the user to enter number of rows?</li>
  <li>Get data cell by cell from user using a loop?</li>
<li>Generate an html page to display above data in a table?</li>
                <li>Store the page in a folder on desktop.</li>
</ol> 
  <div id="load_event" runat="server">

     <a href="lab01.pdf.pdf" download> Download Lab01 Pdf</a>
 
 </div>         

<div>

    	
		<pre>
			<code>


<table>
  <tr>
    <th>Company</th>
    <th>Contact</th>
    <th>Country</th>
  </tr>
  <tr>
    <td>Alfreds Futterkiste</td>
    <td>Maria Anders</td>
    <td>Germany</td>
  </tr>
  <tr>
    <td>Centro comercial Moctezuma</td>
    <td>Francisco Chang</td>
    <td>Mexico</td>
  </tr>
  <tr>
    <td>Ernst Handel</td>
    <td>Roland Mendel</td>
    <td>Austria</td>
  </tr>
  <tr>
    <td>Island Trading</td>
    <td>Helen Bennett</td>
    <td>UK</td>
  </tr>
  <tr>
    <td>Laughing Bacchus Winecellars</td>
    <td>Yoshi Tannamuri</td>
    <td>Canada</td>
  </tr>
  <tr>
    <td>Magazzini Alimentari Riuniti</td>
    <td>Giovanni Rovelli</td>
    <td>Italy</td>
  </tr>
</table>
<h2>Code</h2>
include <iostream>
#include <fstream>
#include <string>
#include <cstdlib>
using namespace std;
int main()
{
 int rows, columns;
 cout << "Enter number of columns: ";
 cin >> columns;
 cout << "Enter number of rows: ";
 cin >> rows;
 // Create a 2D array to hold the data
 string data[rows][columns],col_name[columns];
for (int i=0;i<columns;i++)
 {
 cout<<"Enter name of columns : ";
 cin>>col_name[i];
 }
 cout<<"\n\t\t*******Enter Data in table******* \n\n";
for(int i=0;i<rows;i++)
{
 cout<<"Enter data in "<<i+1<< " rows\n";
 for(int j=0;j<columns;j++)
 {
 cout<<"\nEnter "<<col_name[j]<<" : ";
 cin>>data[i][j];
 }
}
 // Create an output file stream to write the HTML file
 // ofstream outFile("table.html");
 std::string desktopPath = std::getenv("USERPROFILE");
 desktopPath += "\\Desktop\\";
 // Create an output file stream and open the file for writing
 std::ofstream outFile(desktopPath + "table.html");
 // Write the HTML code to the file
 outFile << "<!DOCTYPE html>\n";
 outFile << "<html>\n";
 outFile << "<head>\n";
 outFile << "<style>\n";
 outFile << "table {\n";
 outFile << " font-family: arial, sans-serif;\n";
 outFile << " border-collapse: collapse;\n";
 outFile << " width: 100%;\n";
 outFile << "}\n";
 outFile << "td, th {\n";
 outFile << " border: 1px solid #dddddd;\n";
 outFile << " text-align: left;\n";
 outFile << " padding: 8px;\n";
 outFile << "}\n";
 outFile << "tr:nth-child(even) {\n";
 outFile << " background-color: #dddddd;\n";
 outFile << "}\n";
 outFile << "</style>\n";
 outFile << "</head>\n";
 outFile << "<body>\n";
 outFile << "<h HTML Table</h>\n";
 outFile << "<table>\n";
 outFile << "<tr>\n";
 for (int j = 0; j < columns; j++) {
 outFile << "<th" << col_name[j] << "th>\n";
 //outFile << "<th" << data[0][j] << "th>\n";
 }
 outFile << "</tr>\n";
 for (int i = 0; i < rows; i++) {
 outFile << "<tr>\n";
 for (int j = 0; j < columns; j++) {
 outFile << "<td" << data[i][j] << "</td>\n";
 }
 outFile << "</tr>\n";
 }
 outFile << "</table>\n";
 outFile << "</body>\n";
 outFile << "</html>\n";
 // Close the output file stream
 outFile.close();
 cout << "HTML file generated and stored on desktop." << endl;
 return 0;
}
				
			</code>
		</pre>
    </div>
    <h2>Output</h2>
	
    <image><img src="lab1ss.PNG" alt="lab01" ></image>

</body>
</html>

