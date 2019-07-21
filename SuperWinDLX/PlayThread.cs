using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Web;

namespace SuperWinDLX
{
    public class PlayThread
    {
        private  PlayThread()  { }
        private WebForm1 owner;
        private static PlayThread instance = null;

        public static PlayThread GetInstance() {
            if (instance == null) instance = new PlayThread();
            return instance;
        }

        public void SetOwner(WebForm1 owner)
        {
         this.owner = owner;
        }


        public void RunPlayThread()
        {

            owner.Println("Nacisnieto przycisk Play");
            IntThread thInt = IntThread.GetInstance();
            thInt.SetOwner(owner);
            ThreadStart ts = new ThreadStart(thInt.RunIntThread);
            Thread intThread = new Thread(ts);
            intThread.Start();
        }
    }
}