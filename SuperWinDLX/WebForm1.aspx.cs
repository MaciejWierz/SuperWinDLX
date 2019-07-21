using System;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SuperWinDLX
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        public String[] code;
        private int[] panelvisibility = new int[4] { 0, 1, 2, 3};
        private int[] registersDisplayMod = new int[4] {0,0,0,0}; 
        public String[] registers = new String[32];
        private ArrayList tablerows1 = new ArrayList();
        private ArrayList tablerows2 = new ArrayList();
        private ArrayList tablerows3 = new ArrayList();
        private static Label ioLabels;

        protected void Page_Load(object sender, EventArgs e)
        {

            //Wyzerowanie tablicy rejestrów
            for (int i = 0; i < registers.Length; i++)
            {
                registers[i] = "0";
            }
            registers[0] = "1"; registers[1] = "11"; registers[2] = "35"; registers[3] = "188";

            ioLabels = this.iolabel;

            if (!IsPostBack)
            {


                selectDisplayModDDL1.Items.Add("dec"); selectDisplayModDDL1.Items.Add("hex"); selectDisplayModDDL1.Items.Add("bin");
                selectDisplayModDDL2.Items.Add("dec"); selectDisplayModDDL2.Items.Add("hex"); selectDisplayModDDL2.Items.Add("bin");
                selectDisplayModDDL3.Items.Add("dec"); selectDisplayModDDL3.Items.Add("hex"); selectDisplayModDDL3.Items.Add("bin");
                codePanel1.Visible = true;
                codePanel2.Visible = false; 
                codePanel3.Visible = false;
                registerPanel1.Visible = false;
                displayRegisters(2,registersDisplayMod[2]);
                registerPanel3.Visible = false;
                cyclePanel1.Visible = false;
                cyclePanel2.Visible = false;
                cyclePanel3.Visible = true;



            }
        }


        public void Println(String message)
        {
            this.iolabel.Text += (message + "<br/> <hr>");
        }

        public static void PrintSln(String message)
        {
            ioLabels.Text += (message + "<br/> <hr>");
        }


        protected void btn_Click(Object sender, EventArgs e)
        {

            Button selectedBtn = (Button)sender;

            switch (selectedBtn.ID)
            {
                case "btn11":
                    panelvisibility[1] = 1;
                    codePanel1.Visible = true;
                    registerPanel1.Visible = false;
                    cyclePanel1.Visible = false;
                    break;

                case "btn12":
                    panelvisibility[1] = 2;
                    codePanel1.Visible = false;
                    displayRegisters(1, registersDisplayMod[1]);
                    cyclePanel1.Visible = false;
                    break;

                case "btn13":
                    panelvisibility[1] = 3;
                    codePanel1.Visible = false;
                    registerPanel1.Visible = false;
                    cyclePanel1.Visible = true;
                    break;
                case "btn14":
                    panelvisibility[1] = 4;
                    codePanel1.Visible = false;
                    registerPanel1.Visible = false;
                    cyclePanel1.Visible = false;
                    break;
/////////////////////////////////////////////////////////////////////////
                case "btn21":
                    panelvisibility[2] = 1;
                    codePanel2.Visible = true;
                    registerPanel2.Visible = false;
                    cyclePanel2.Visible = false;
                    break;

                case "btn22":
                    panelvisibility[2] = 2;
                    codePanel2.Visible = false;
                    displayRegisters(2, registersDisplayMod[2]);
                    cyclePanel2.Visible = false;
                    break;

                case "btn23":
                    panelvisibility[2] = 3;
                    codePanel2.Visible = false;
                    registerPanel2.Visible = false;
                    cyclePanel2.Visible = true;
                    break;
                case "btn24":
                    panelvisibility[1] = 4;
                    codePanel1.Visible = false;
                    registerPanel1.Visible = false;
                    cyclePanel1.Visible = false;
                    break;
//////////////////////////////////////////////////////////////////////
                case "btn31":
                    panelvisibility[3] = 1;
                    codePanel3.Visible = true;
                    registerPanel3.Visible = false;
                    cyclePanel3.Visible = false;
                    break;

                case "btn32":
                    panelvisibility[3] = 2;
                    codePanel3.Visible = false;
                    displayRegisters(3, registersDisplayMod[3]);
                    cyclePanel3.Visible = false;
                    break;

                case "btn33":
                    panelvisibility[3] = 3;
                    codePanel3.Visible = false;
                    registerPanel3.Visible = false;
                    cyclePanel3.Visible = true;
                    break;
                case "btn34":
                    panelvisibility[1] = 4;
                    codePanel1.Visible = false;
                    registerPanel1.Visible = false;
                    cyclePanel1.Visible = false;
                    break;
            }



        }

        protected void readFileBtn_Click(object sender, EventArgs e)
        {
            Button selectedBtn = (Button)sender;
            Stream filestream;
            FileUpload selectedFileUpload = fileUpload1;

            switch (selectedBtn.ID)
            {
                case "readFileBtn1":
                    selectedFileUpload = fileUpload1;
                    break;
                case "readFileBtn2":
                    selectedFileUpload = fileUpload2;
                    break;
                case "readFileBtn3":
                    selectedFileUpload = fileUpload3;
                    break;

            }

            if (selectedFileUpload.HasFile)
            {
                string fileName = selectedFileUpload.PostedFile.FileName;
                string fileExtension = Path.GetExtension(fileName).ToLower();


                if (fileExtension == ".txt")
                {
                    int fileLen = selectedFileUpload.PostedFile.ContentLength;
                    StringBuilder displayString = new StringBuilder();

                    filestream = selectedFileUpload.FileContent;
                    Byte[] input = new Byte[fileLen];

                    filestream.Read(input, 0, fileLen);


                    code = Encoding.Default.GetString(input).Split(';');
                    int iteration = 0;
                    

                    foreach (String i in code)
                    {
                        if (i != "")
                        {
                        iteration++;
                        TableRow newrow = new TableRow(); newrow.BorderStyle = BorderStyle.Ridge;
                            TableCell cell1 = new TableCell(); 
                            //cell1.Text = "" + iteration;
                            TableCell cell2 = new TableCell(); 
                            //cell2.Text = i;

                            cell1.Text = ""+iteration;
                            cell2.Text = i;

                 
                            newrow.Cells.Add(cell1);  cell1.BorderStyle = BorderStyle.Ridge; 
                            newrow.Cells.Add(cell2); cell2.BorderStyle = BorderStyle.Ridge;

                            codeTable1.Rows.Add(newrow); 

                            tablerows1.Add(newrow);
                            tablerows2.Add(newrow);
                            tablerows3.Add(newrow);

                        }
                        //readFileLbl1.Text += (i + "<br/>");
                    }



                    Println("Załadowano plik");
                }
            }
            else Println("Brak wybranego pliku");

          
            
        }


        private void displayRegisters(int selectedPanel, int mod)
        {
            String toDisplay ="";
            switch (mod)
            {
                case 0:
                    for (int i = 0; i < registers.Length; i++)
                    {
                        if (i < 16) toDisplay += ("R" + i + ": " + registers[i] + "<br/>");
                        else toDisplay += ("F" + (i - 15) + ": " + registers[i] + "<br/>");

                    }
                    break;
                case 1:
                    for (int i = 0; i < registers.Length; i++)
                    {
                        int tmp = Int32.Parse(registers[i]);
                        if (i < 16) toDisplay += ("R" + i + ": " + tmp.ToString("X") + "<br/>");
                        else toDisplay += ("F" + (i - 15) + ": " + tmp.ToString("X") + "<br/>");

                    }
                    break;
                case 2:
                    for (int i = 0; i < registers.Length; i++)
                    {
                        int tmp = Int32.Parse(registers[i]);
                        if (i < 16) toDisplay += ("R" + i + ": " + Convert.ToString(tmp,2) + "<br/>");
                        else toDisplay += ("F" + (i - 15) + ": " + Convert.ToString(tmp, 2) + "<br/>");

                    }
                    break;

            }

            switch (selectedPanel)
            {
                case 1:
                    registerPanel1.Visible = true;
                    registerLbl1.Text = toDisplay;
                    break;
                case 2:
                    registerPanel2.Visible = true;
                    registerLbl2.Text = toDisplay;
                    break;
                case 3:
                    registerPanel3.Visible = true;
                    registerLbl3.Text = toDisplay;
                    break;
            }
        }

        protected void selectDisplayModDDL1_SelectedIndexChanged(object sender, EventArgs e)
        {
            DropDownList selectedList = (DropDownList)sender;
            switch (selectedList.ID)
            {
                case "selectDisplayModDDL1":
                    if (selectedList.SelectedIndex == 0) registersDisplayMod[1] = 0;
                    else if (selectedList.SelectedIndex == 1) registersDisplayMod[1] = 1;
                    else if (selectedList.SelectedIndex == 2) registersDisplayMod[1] = 2;

                    displayRegisters(1, registersDisplayMod[1]);
                    break;
                case "selectDisplayModDDL2":
                    if (selectedList.SelectedIndex == 0) registersDisplayMod[2] = 0;
                    else if (selectedList.SelectedIndex == 1) registersDisplayMod[2] = 1;
                    else if (selectedList.SelectedIndex == 2) registersDisplayMod[2] = 2;

                    displayRegisters(2, registersDisplayMod[2]);
                    break;
                case "selectDisplayModDDL3":
                    if (selectedList.SelectedIndex == 0) registersDisplayMod[3] = 0;
                    else if (selectedList.SelectedIndex == 1) registersDisplayMod[3] = 1;
                    else if (selectedList.SelectedIndex == 2) registersDisplayMod[3] = 2;

                    displayRegisters(3, registersDisplayMod[3]);
                    break;


            }
            
        }

        protected void playButton_Click(object sender, EventArgs e)
        {
            PlayThread pt = PlayThread.GetInstance();
            pt.SetOwner(this);
            ThreadStart ts = new ThreadStart(pt.RunPlayThread);
            Thread playThread = new Thread(ts) ;
            playThread.Start();
            Thread.Sleep(2000);
            playThread.Abort();
        }

  


        protected void stepbutton_Click(object sender, EventArgs e)
        {
            Println("Przycisk wykonania jednego kroku");
        }

        protected void cyclebutton_Click(object sender, EventArgs e)
        {
            Println("Przycisk wykonania jednego cyklu");
        }
    }
}