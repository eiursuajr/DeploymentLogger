﻿
// Generated by MyGeneration Version # (1.1.5.0)

using System;
using DL_DAL.Master;

namespace DL_WEB.DAL.Master
{
	public class Server : _Server
	{
		public Server()
		{
            base.ConnectionString = Master.DBConnectionString;
		}
	}
}
