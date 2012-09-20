using System;
using System.Data;
using System.Web;
using System.Net.Mail;
using System.Web.UI;
using System.Text;
using System.IO;
using System.Reflection;
using System.Diagnostics;
using System.Collections;

namespace DL_WEB.BLL.ErrorHandling
{
	public class WebException
	{

		#region Private Members

		private bool _SendMail = true;
		private string _Site = ("localhost");
		private string _MailFrom = ("administrator@northamericanland.com");
		private string _MailTo = ("andrey.magazinov@micajah.com");
		private string _MailAdmin = ("administrator@northamericanland.com");
		private string strErrorMessage = String.Empty;
		private Exception _CurrentException;
		private bool _DrillDownInCache = false;
		private bool _ReturnCache = false;
		private string FullTrace = String.Empty;
		private int _TheFloodCount = 10;
		private int _FloodMins = 30;
		private string _ContentAfterException = String.Empty;
		private string _SmtpServer = "localhost";
		StringBuilder Sb = new StringBuilder();

		#endregion

		#region Public Members

		public string Site
		{
			set
			{
				_Site = value;
			}
		}

		public int FloodCount
		{
			set
			{
				_TheFloodCount = value;
			}
		}
		

		public int FloodMins
		{
			set
			{
				_FloodMins = value;
			}
		}

		public string MailFrom
		{
			set
			{
				_MailFrom = value;
			}
		}

		public string MailTo
		{
			set
			{
				_MailTo = value;
			}
		}

		public Exception CurrentException
		{
			set
			{
				_CurrentException = value;
			}
		}

		public bool DrillDownInCache
		{
			set
			{
				_DrillDownInCache = value;
			}
		}

		public bool ReturnCache
		{
			set
			{
				_ReturnCache = value;
			}
		}

		public string ContentAfterException
		{
			set
			{
				_ContentAfterException = value;
			}
		}

		public string SmtpServer
		{
			set
			{
				_SmtpServer = value;
			}
		}

		public string MailAdmin
		{
			set
			{
				_MailAdmin = value;
			}
		}

		#endregion

		/// <summary>
		/// This method constructs the e-mail and then sends the message.
		/// </summary>
		public void Handle()
		{

			//The first thing we need to do is check that we can access the Current Web Context
			if (System.Web.HttpContext.Current != null)
			{

				#region Send the e-mail Message

				//Set up the Mail Object we will use to send the Error message
				System.Web.Mail.MailMessage myMail = new System.Web.Mail.MailMessage();
				myMail.BodyFormat = System.Web.Mail.MailFormat.Html;

				//Set the From Address
				myMail.From = this._MailFrom;

				//Ensure the Mail Admin gets a copy of all messages, this is especially useful if there are 
				//several developers on your team - set MailAdmin to a shared Mailbox e-mail address
				if (this._MailTo != (_MailAdmin))
				{
					myMail.To = (this._MailTo + (";" + _MailAdmin));
				}
				else
				{
					myMail.To = this._MailTo;
				}

				#region Contstruct the E-mail

				try
				{
					//Set up the Mail Header
					GetMailHeader();

					//Set up the Exceptions
					GetExceptions();

					//Set up the Version Numbers
					GetVersionNumbers();

					//Get the Content Passed in After the Exceptions
					if (_ContentAfterException != String.Empty)
					{
						Sb.Append(_ContentAfterException);
						Sb.Append("<hr />");
					}

					//Get the Form
					GetForm();

					//Get the QueryString
					GetQueryString();

					//Get the Session
					GetSession();

					//Get the Application
					GetApplication();

					//Get the Request Cookies
					GetRequestCookies();

					//Get the Response Cookies
					GetResponseCookies();

					//Get the Request Headers
					GetRequestHeaders();

					//Get the Response Headers
					GetResponseHeaders();

					//Get the Cache
					if (_ReturnCache)
					{
						GetCache();
					}

					//Get the ServerVariables
					GetServerVariables();
					
					//Get the Trace
					GetTrace();

					//Get the Mail Footer
					Sb.Append(GetMailFooter());

				}
				catch (Exception ex)
				{
					//Handle any exceptions by sending them in the e-mail.
					Sb.Append("<h1 style='color:red;'>There was a problem building this message</h1>");
					Sb.Append("<p>" + ex.Message.ToString() + "</p>");
					Sb.Append("<p>" + ex.StackTrace.ToString() + "</p>");
					myMail.To = (this._MailAdmin);
				}

				#endregion

				//Set the e-mail Subject to the Site name and the Error Message
				myMail.Subject = this._Site + " - " + strErrorMessage;

				//Set the Body of the e-mail from the String Builder content.
				myMail.Body = Sb.ToString();

				if  (!EmailFlooding() && (_SendMail == true))
				{
					//Set the Mail Server and Send the e-mail
					System.Web.Mail.SmtpMail.SmtpServer = _SmtpServer;
					System.Web.Mail.SmtpMail.Send(myMail);
				}

				#endregion

			}

		}

		/// <summary>
		/// This method determines wether the e-mail should be sent.
		/// </summary>
		/// <returns>Wether or not the e-mail should be sent</returns>
		private bool EmailFlooding()
		{
			#region Private Members
			int TheCount = 1;
			bool flag = false;
			#endregion

			//Check to see if the e-mail can be sent, if there is no Cache item, then the e-mail can be sent.

			#region Flood Checking

			//This is acheived by Using the Full Trace of the Exception tree as the Cache Key, enabling the 
			//Exception tree to be used as a Unique entry for the specific exception that is being thrown.
			if (System.Web.HttpContext.Current.Cache[FullTrace + "_Count"] == null)
			{
				System.Web.HttpContext.Current.Cache.Add(FullTrace + "_Count", //The Cache Key
						TheCount, //The Value (This is used to determine when to stop sending a specific Error). 
						null, //There are no dependancies.
						DateTime.Now.AddMinutes(_FloodMins), //The Time for which the Cache Entry is Valid.
						System.TimeSpan.Zero, //Set the Sliding Expiration to 0.
						System.Web.Caching.CacheItemPriority.Normal, //The Level at which the Cache item is removed from the Server.
						null); //Callback (There isn't one)
			}
			else
			{
				//If the Cache item already exists, the server needs to determine that the Error can be sent or not
				//by counting the number of times the error has been encountered and setting the Cache Entry's value
				//to the number of times the Cache item has happened.
				TheCount = Convert.ToInt32(System.Web.HttpContext.Current.Cache[FullTrace + "_Count"]); 
				TheCount++;
				System.Web.HttpContext.Current.Cache[FullTrace + "_Count"] = TheCount;

				//If the cache Count is more than or equal to the Allowed count return True to state that we've encountered a Flood.
				if (TheCount >= _TheFloodCount)
				{
					flag = true;
				}
			}

			#endregion

			//Return the Value.
			return flag;
		}

		private void AppendTableRow(string CellName, string CellValue, bool Header)
		{
			#region Add the Table Row To the String Builder
			Sb.Append("<tr>");
			if (Header)
			{
				Sb.Append("<td valign='top'><b>" + CellName + "</b></td>");
			}
			else
			{
				Sb.Append("<td valign='top'>" + CellName + "</td>");
			}
			Sb.Append("<td>" + CellValue + "</td>");
			Sb.Append("</tr>");
			#endregion
		}


		private void AppendTableRow(string CellName, string CellValue, bool Header, string ValueStyle)
		{
			#region Add the Table Row To the String Builder
			Sb.Append("<tr>");
			if (Header)
			{
				Sb.Append("<td valign='top'><b>" + CellName + "</b></td>");
			}
			else
			{
				Sb.Append("<td valign='top'>" + CellName + "</td>");
			}
			Sb.Append("<td><span style='" + ValueStyle + "'>" + CellValue + "</span></td>");
			Sb.Append("</tr>");
			#endregion
		}

		private string CreateAnchor(string Text)
		{
			return ("<a href=\"" + Text + "\">" + Text + "</a>");
		}

		private void AppendTableHeader()
		{
			Sb.Append("<table cellpadding=2 cellspacing=1>");
		}

		private void AppendTableFooter()
		{
			Sb.Append("</table>");
		}

		private void AppendHr()
		{
			Sb.Append("<hr />");
		}

		private void AppendHashTable(System.Collections.Hashtable ht)
		{
			#region Add the Table Rows To the String Builder
			Sb.Append("<tr>");
			Sb.Append("<td valign='top'></td>");
			Sb.Append("<td valign='top'>");
			Sb.Append("<table>");

			foreach(string hkey in ht.Keys) 
			{
				AppendTableRow(hkey.ToString(),ht[hkey].ToString(),false);
			}
									
			Sb.Append("</table>");
			Sb.Append("</td>");
			Sb.Append("</tr>");
			#endregion
		}

		private void AppendArrayList(System.Collections.ArrayList al)
		{
			#region Add the Table Rows To the String Builder
			foreach(object item in al) 
			{
				Sb.Append("<tr>");
				Sb.Append("<td valign='top'></td>");
				Sb.Append("<td>" + item.ToString() + "</i></td>");
				Sb.Append("</tr>");
			}
			#endregion
		}

		private void AppendIErrorInterface(IError e)
		{
			#region Add the IError Information to the String Builder
			string thedebuginformation = e.GetDebugInformation();
			Sb.Append("<tr>");
			Sb.Append("<td valign='top'>&nbsp;</td>");
			Sb.Append("<td>" + thedebuginformation + "</td>");
			Sb.Append("</tr>");
			#endregion
		}

		private void AppendStateBagEntry(string Name, object Value, Type ObjectType)
		{
			#region Render Specific Types as HTML
			if (ObjectType == typeof(System.String))
			{
				AppendTableRow(Name,(string)Value,false);
			}
			else if (ObjectType == typeof(System.Collections.Hashtable))
			{
				AppendHashTable((System.Collections.Hashtable)Value);
			}
			else if (ObjectType == typeof(System.Collections.ArrayList))
			{
				AppendArrayList((System.Collections.ArrayList)Value);
			}
			else if (Value is IError)
			{
				AppendIErrorInterface((IError)Value);
			}
			else if (ObjectType == typeof(System.Xml.XmlDocument)) 
			{
				AppendTableRow(String.Empty,System.Web.HttpContext.Current.Server.HtmlEncode(((System.Xml.XmlDocument)Value).OuterXml),false);
			}
			else if (ObjectType == typeof(System.Data.DataTable)) 
			{
				AppendDataTable((System.Data.DataTable)Value);
			}
			else
			{
				AppendTableRow("'" + Name + "'",Convert.ToString(Value),false);
			}
			#endregion
		}

		private void AppendDataTable(System.Data.DataTable Value)
		{
			System.Data.DataTable Dt = (System.Data.DataTable)Value;

			AppendTableRow("Row Count","RowCount : " + Dt.Rows.Count.ToString(),true);

			Sb.Append("<tr>");
			Sb.Append("<td valign='top'></td>");
			Sb.Append("<td>");
									
			if (Dt.Rows.Count > 0)
			{

				Sb.Append("<table cellspacing=2 cellpadding=2 border=1>");

				Sb.Append("<tr>");
				foreach(System.Data.DataColumn Dc in Dt.Columns)
				{
					Sb.Append("<th>" + Dc.ColumnName + "</th>");
				}
				Sb.Append("</tr>");

				foreach(DataRow Dr in Dt.Rows)
				{
											
					Sb.Append("<tr>");
					foreach(System.Data.DataColumn Dc in Dt.Columns)
					{
						Sb.Append("<td>" + Dr[Dc.ColumnName].ToString() + "</td>");
					}
					Sb.Append("</tr>");

				}

				Sb.Append("</table>");

			}	
		}

		private void GetMailHeader()
		{

			Sb.Append("<html>");
			Sb.Append("<head>");
			Sb.Append("<title>" + this._Site + " - Site Issue</title>");
			Sb.Append("</head>");

			Sb.Append("<style>");
			Sb.Append("body{	font-family:Verdana;font-size:8pt;background:#FFFF99;}p{font-family:Verdana;font-size:8pt;}td{	font-family:Verdana;font-size:8pt;}span{	font-family:Verdana;font-size:8pt;}");
			Sb.Append("</style>");

			Sb.Append("<body>");
			Sb.Append("<h1>" + this._Site + " - Site Issue</h1>");
			Sb.Append("<h2>" + DateTime.Now.ToString("r") + "</h2>");

			AppendHr();

			AppendTableHeader();
			AppendTableRow("Url",CreateAnchor(System.Web.HttpContext.Current.Request.Url.AbsoluteUri.ToString()),true);
			AppendTableFooter();

			AppendHr();

			AppendTableHeader();
			AppendTableRow("User IP Address",System.Web.HttpContext.Current.Request.UserHostAddress.ToString(),true);

			//If the HostName is returned and isn't the same as the IP Address then We append the row.
			if (System.Web.HttpContext.Current.Request.UserHostAddress.ToString() != System.Web.HttpContext.Current.Request.UserHostName.ToString())
			{
				AppendTableRow("User Host",System.Web.HttpContext.Current.Request.UserHostName.ToString(),true);
			}
			AppendTableFooter();

			AppendHr();

			if (System.Web.HttpContext.Current.Request.UrlReferrer != null)
			{

				AppendTableHeader();
				AppendTableRow("Url Referrer",CreateAnchor(System.Web.HttpContext.Current.Request.UrlReferrer.AbsoluteUri.ToString()),true);
				AppendTableFooter();

				AppendHr();
			}

			AppendTableHeader();
			AppendTableRow("Machine Name",System.Web.HttpContext.Current.Server.MachineName.ToString(),true);
			AppendTableFooter();

			AppendHr();

		}


		private void GetVersionNumbers()
		{

			Sb.Append("<table cellpadding=2 cellspacing=1>");
			Sb.Append("<tr>");
			Sb.Append("<td valign='top' colspan=2><h3>Versions</h3></td>");
			Sb.Append("</tr>");
			Sb.Append("</table>");

			AppendTableHeader();
			AppendTableRow(".NET Framework Version",System.Environment.Version.ToString(),true);
			AppendTableRow("&#160;","&#160;",false);

			Assembly[] assemblies = AppDomain.CurrentDomain.GetAssemblies();
			
			foreach(Assembly a in assemblies)
			{	

				if ((a.GetName().Name.ToString().IndexOf("System") < 0) && (a.GetName().Version.ToString() != "0.0.0.0") && (a.GetName().Name.ToString().IndexOf("mscorlib") < 0))
				{
					
					string Version = a.GetName().Version.ToString();
					AssemblyInformationalVersionAttribute[] infoversion =	(AssemblyInformationalVersionAttribute[]) a.GetCustomAttributes(	typeof(AssemblyInformationalVersionAttribute), false );
					if (infoversion.Length == 1 )
					{
						Version += (" (" + infoversion[0].InformationalVersion.ToString() + ")");
					}

					AppendTableRow(a.GetName().Name.ToString(),Version,false);
					AppendTableRow("Codebase",CreateAnchor(a.CodeBase.ToString()),false);

					FileInfo F = new FileInfo(a.Location);
					
					AppendTableRow("Last Write Time",File.GetLastWriteTime(F.FullName).ToLongDateString() + " " + File.GetLastWriteTime(F.FullName).ToLongTimeString(),false);
					AppendTableRow("&#160;","&#160;",false);

				}

			}

			AppendTableFooter();
			AppendHr();

		}

		private void GetExceptions()
		{

			string strInnerErrorType = ""; 
			string strErrorTrace = ""; 
			string strErrorLine = ""; 
			string strErrorFile = ""; 
			string strErrorPage = System.Web.HttpContext.Current.Request.PhysicalPath; 

			AppendTableHeader();

			Sb.Append("<tr>");
			Sb.Append("<td colspan=2><h3>Exceptions</h3></td>");
			Sb.Append("</tr>");
			while (_CurrentException != null)
			{

				Exception exInnerError = _CurrentException; 
				if (exInnerError != null) 
				{ 

					strInnerErrorType = exInnerError.GetType().ToString(); 
					switch (strInnerErrorType) 
					{ 
						// ascx/aspx compile error 
						case "System.Web.HttpCompileException" : 
							System.CodeDom.Compiler.CompilerErrorCollection colErrors = ((System.Web.HttpCompileException)exInnerError).Results.Errors; 
							if (colErrors.Count > 0) 
							{ 
								strErrorLine = colErrors[0].Line.ToString(); 
								strErrorFile = colErrors[0].FileName; 
								strErrorMessage = colErrors[0].ErrorNumber + ": " + colErrors[0].ErrorText; 
							} 
							break; 

						// any other error like XML parsing or bad string manipulations 
						default : 
							System.Diagnostics.StackTrace stError = new System.Diagnostics.StackTrace(exInnerError, true); 
							for (int i=0;i<stError.FrameCount;i++) 
							{ 
								if (stError.GetFrame(i).GetFileName() != null) 
								{ 
									strErrorLine = stError.GetFrame(i).GetFileLineNumber().ToString(); 
									strErrorFile = stError.GetFrame(i).GetFileName(); 
									strErrorMessage = exInnerError.Message; 
									break; 
								} 
							} 
							if (strErrorFile == "") 
							{ 
								strErrorMessage = "Untrapped Exception: " + exInnerError.Message; 
								strErrorFile = "Unknown"; 
							} 
							break; 
					} 
					strErrorTrace = exInnerError.StackTrace; 
					FullTrace += strErrorTrace;

				} 
				else 
				{ 
					strErrorMessage = _CurrentException.Message; 
					strErrorTrace = _CurrentException.StackTrace; 
					strErrorFile = "Unknown"; 
				} 

				if (strErrorMessage.IndexOf("Application is restarting") > -1)
				{
					System.Web.HttpContext.Current.Response.Clear();
					System.Web.HttpContext.Current.Response.Buffer = false;
					System.Web.HttpContext.Current.Response.Write("Error, Site is restarting. Try again later.");
					_SendMail = false;
					System.Web.HttpContext.Current.Response.Flush();
					System.Web.HttpContext.Current.Response.End();
				}

				if ((strInnerErrorType != null) && (strInnerErrorType.Trim().Length > 0))
				{
					AppendTableRow("Type",strInnerErrorType.ToString(),true);
				}

				if ((strErrorMessage != null) && (strErrorMessage.Trim().Length > 0))
				{
					AppendTableRow("Message",strErrorMessage.ToString(),true,"color:red;");
				}

				if ((strErrorTrace != null) && (strErrorTrace.Trim().Length > 0))
				{
					AppendTableRow("StackTrace",strErrorTrace.ToString().ToString().Replace("\n","<br />"),true);
				}
					
				if ((strErrorFile != null) && (strErrorFile.Trim().Length > 0))
				{
					AppendTableRow("Error File",CreateAnchor(strErrorFile.ToString()),true);
				}

				if ((strErrorLine != null) && (strErrorLine.Trim().Length > 0))
				{
					AppendTableRow("Error Line",strErrorLine.ToString(),true);
				}

				Sb.Append("<tr>");
				Sb.Append("<td colspan2>&nbsp;</td>");
				Sb.Append("</tr>");

				_CurrentException = _CurrentException.InnerException;

			}
			AppendTableFooter();
			AppendHr();
		}

		private void GetForm()
		{

			if (System.Web.HttpContext.Current.Request.Form.Count > 0)
			{
				AppendTableHeader();
				Sb.Append("<tr>");
				Sb.Append("<td colspan=2><b>Form</b></td>");
				Sb.Append("</tr>");

				foreach( string key in System.Web.HttpContext.Current.Request.Form)
				{
					AppendTableRow(key,System.Web.HttpContext.Current.Request.Form[key].ToString(),false);
				}

				AppendTableFooter();
				AppendHr();
			}

		}


		private void GetQueryString()
		{

			if (System.Web.HttpContext.Current.Request.QueryString.Count > 0)
			{
				AppendTableHeader();

				Sb.Append("<tr>");
				Sb.Append("<td colspan=2><b>QueryString</b></td>");
				Sb.Append("</tr>");

				foreach( string key in System.Web.HttpContext.Current.Request.QueryString)
				{
					AppendTableRow(key,System.Web.HttpContext.Current.Request.QueryString[key].ToString(),false);
				}

				AppendTableFooter();

				AppendHr();
			}

		}

		private void GetSession()
		{
			if ((System.Web.HttpContext.Current != null) && (System.Web.HttpContext.Current.Session != null) && (System.Web.HttpContext.Current.Session.Count > 0))
			{

				AppendTableHeader();
				Sb.Append("<tr>");
				Sb.Append("<td colspan=2><b>Session</b></td>");
				Sb.Append("</tr>");

				foreach(string key in System.Web.HttpContext.Current.Session.Keys)
				{
					AppendStateBagEntry(key,System.Web.HttpContext.Current.Session[key],System.Web.HttpContext.Current.Session[key].GetType());
				}

				AppendTableFooter();
				AppendHr();

			}
		}

		private void GetApplication()
		{

			if (System.Web.HttpContext.Current.Application != null)
			{

				AppendTableHeader();
				Sb.Append("<tr>");
				Sb.Append("<td colspan=2><b>Application</b></td>");
				Sb.Append("</tr>");

				foreach(string key in System.Web.HttpContext.Current.Application.Keys)
				{
					AppendStateBagEntry(key,System.Web.HttpContext.Current.Application[key],System.Web.HttpContext.Current.Application[key].GetType());
				}

				AppendTableFooter();
				AppendHr();
			}
		}


		private void GetRequestCookies()
		{

			if (System.Web.HttpContext.Current.Request.Cookies.Count > 0)
			{
				AppendTableHeader();
				Sb.Append("<tr>");
				Sb.Append("<td colspan=2><b>Request Cookies</b></td>");
				Sb.Append("</tr>");

				foreach( string key in System.Web.HttpContext.Current.Request.Cookies)
				{
					AppendTableRow(key,System.Web.HttpContext.Current.Request.Cookies[key].Value.ToString(),true);

					if (System.Web.HttpContext.Current.Request.Cookies[key].HasKeys)
					{

						foreach(string subkey in System.Web.HttpContext.Current.Request.Cookies[key].Values)
						{

							AppendTableRow(subkey,System.Web.HttpContext.Current.Request.Cookies[key][subkey].ToString(),false);

						}

					}
				}

				AppendTableFooter();
				AppendHr();
			}

		}

		private void GetResponseCookies()
		{

			if (System.Web.HttpContext.Current.Response.Cookies.Count > 0)
			{
				AppendTableHeader();
				Sb.Append("<tr>");
				Sb.Append("<td colspan=2><b>Response Cookies</b></td>");
				Sb.Append("</tr>");

				foreach( string key in System.Web.HttpContext.Current.Response.Cookies)
				{
					AppendTableRow(key,System.Web.HttpContext.Current.Response.Cookies[key].Value.ToString(),true);

					if (System.Web.HttpContext.Current.Response.Cookies[key].HasKeys)
					{

						foreach(string subkey in System.Web.HttpContext.Current.Response.Cookies[key].Values)
						{

							AppendTableRow(subkey,System.Web.HttpContext.Current.Response.Cookies[key][subkey].ToString(),false);

						}

					}
				}

				AppendTableFooter();
				AppendHr();
			}

		}

		private void GetRequestHeaders()
		{
			if (System.Web.HttpContext.Current.Request.Headers.Count > 0)
			{
				AppendTableHeader();
				Sb.Append("<tr>");
				Sb.Append("<td colspan=2><b>Request Headers</b></td>");
				Sb.Append("</tr>");

				foreach( string key in System.Web.HttpContext.Current.Request.Headers)
				{
					AppendTableRow(key,System.Web.HttpContext.Current.Request.Headers[key].ToString(),false);
				}

				AppendTableFooter();
				AppendHr();
			}
		}

		private void GetResponseHeaders()
		{
			//To Be Implimented.
		}


		private void GetServerVariables()
		{
			StringBuilder Sb = new StringBuilder();

			if (System.Web.HttpContext.Current.Request.ServerVariables.Count > 0)
			{
				AppendTableHeader();

				Sb.Append("<tr>");
				Sb.Append("<td colspan=2><b>ServerVariables</b></td>");
				Sb.Append("</tr>");

				foreach( string key in System.Web.HttpContext.Current.Request.ServerVariables)
				{
					Sb.Append("<tr>");
					Sb.Append("<td valign='top'><i>" + key + "</i></td>");
					Sb.Append("<td>" + System.Web.HttpContext.Current.Request.ServerVariables[key].ToString() + "</td>");
					Sb.Append("</tr>");
				}

				AppendTableFooter();

				AppendHr();
			}

		}


		private void GetTrace()
		{

			try
			{

				Sb.Append("<table cellpadding=2 cellspacing=1>");
				Sb.Append("<tr>");
				Sb.Append("<td colspan=2><b>Trace</b></td>");
				Sb.Append("</tr>");

				System.Type trace = System.Web.HttpContext.Current.Trace.GetType();
				MethodInfo mi = trace.GetMethod("Render",BindingFlags.Instance|BindingFlags.NonPublic);
				StringWriter sWriter = new StringWriter();
				HtmlTextWriter htmlWriter = new HtmlTextWriter(sWriter);
				object[] o = new Object[1];
				o[0] = htmlWriter;
				mi.Invoke(System.Web.HttpContext.Current.Trace,o);

				Sb.Append("<tr>");
				Sb.Append("<td valign='top' colspan='2'><i>" + sWriter.ToString() + "</i></td>");
				Sb.Append("</tr>");

			}
			catch(Exception exe)
			{
				Sb.Append("<tr>");
				Sb.Append("<td valign='top' colspan='2'><i>" + exe.Message + "</i></td>");
				Sb.Append("</tr>");
			}
			finally
			{
				Sb.Append("</table>");
			}

		}

		private void GetCache()
		{

			IDictionaryEnumerator cacheEnum = System.Web.HttpContext.Current.Cache.GetEnumerator();
			int CacheCount = 1;

			while (cacheEnum.MoveNext())
			{
				if (CacheCount <= 1)
				{
					Sb.Append("<table cellpadding=2 cellspacing=1>");
					Sb.Append("<tr>");
					Sb.Append("<td colspan=2><b>Cache</b></td>");
					Sb.Append("</tr>");
					CacheCount++;
				}
					
				if (cacheEnum.Key.ToString().IndexOf("System.Web", 0) < 0 && cacheEnum.Key.ToString().IndexOf("ISAPIWorkerRequest", 0) < 0 ) 
				{
					AppendStateBagEntry(cacheEnum.Key.ToString(),cacheEnum.Value,cacheEnum.Value.GetType());
				}

			}

		}


		private string GetMailFooter()
		{

			StringBuilder Sb = new StringBuilder();

			Sb.Append("</table>");
			Sb.Append("<hr />");
			Sb.Append("</body>");
			Sb.Append("</html>");
			
			return Sb.ToString();

		}



		public WebException()
		{
		}
	}
}
