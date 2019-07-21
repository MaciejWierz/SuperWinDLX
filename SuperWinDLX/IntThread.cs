using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Web;

namespace SuperWinDLX
{
    public class IntThread
    {
        public static IntThread instance = null;
        private WebForm1 owner;

        public static IntThread GetInstance()
        {
            if (instance == null) instance = new IntThread();
            return instance;
        }
        private IntThread()
        {

        }

        public void SetOwner(WebForm1 owner)
        {
            this.owner = owner;
        }
        public void RunIntThread()
        {
            owner.Println("Cykl: Int");
            ExThread thEx = ExThread.GetInstance();
            thEx.SetOwner(owner);
            ThreadStart ts = new ThreadStart(thEx.RunExThread);
            Thread exThread = new Thread(ts);
            exThread.Start();
        }

    }
}