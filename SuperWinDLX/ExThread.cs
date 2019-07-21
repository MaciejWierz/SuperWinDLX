using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SuperWinDLX
{
    public class ExThread
    {
        public static ExThread instance = null;
        private WebForm1 owner;

        public static ExThread GetInstance()
        {
            if (instance == null) instance = new ExThread();
            return instance;
        }
        private ExThread()
        {

        }

        public void SetOwner(WebForm1 owner)
        {
            this.owner = owner;
        }
        public void RunExThread()
        {
            owner.Println("Cykl: Ex");
        }
    }
}