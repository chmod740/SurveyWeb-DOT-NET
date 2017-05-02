<%@ WebHandler Language="C#" Class="DownloadQrCode" %>

using System;
using System.Web;
using ThoughtWorks.QRCode.Codec;
using ThoughtWorks.QRCode.Codec.Data;
using ThoughtWorks.QRCode.Codec.Reader;
using ThoughtWorks.QRCode.Geom;
using ThoughtWorks.QRCode.ExceptionHandler;

public class DownloadQrCode : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        try
        {
            if(System.IO.File.Exists(context.Server.MapPath(@"~\") + "qr.zip"))
            {
                System.IO.File.Delete(context.Server.MapPath(@"~\") + "qr.zip");
            }
        }
        catch (Exception e) {
            
        }
        
        
        int id = int.Parse(context.Request.Params["id"]);
        int count = int.Parse(context.Request.Params["count"]);

        
        for (int i = 1; i <= count; i++ )
        {

            string key = SurveyService.GetRandomString(24, true, true, false, false, "");
            createCode(context.Server,id, i,
                context.Request.Url.AbsoluteUri.Replace(context.Request.Url.AbsoluteUri.Split('/')[context.Request.Url.AbsoluteUri.Split('/').Length -1], "") + "Answer.aspx?key=" + key);
            SurveyService.addSurveyArray(id, key);
        }

        ZipHelper.CreateZip(context.Server.MapPath(@"~\Upload" + id), context.Server.MapPath(@"~\") + "qr.zip");
        //createCode(context.Server, 0, "abc");
        try
        {
            System.IO.DirectoryInfo subdir = new System.IO.DirectoryInfo(context.Server.MapPath(@"~\Upload" + id));
            subdir.Delete(true);          //删除子目录和文件
        }
        catch (Exception e) 
        {
             
        }
        
        
        //context.Response.ContentType = "text/plain";
        //context.Response.Write("Hello World");
        doResponse(context);
        
    }
    
    public bool IsReusable {
        get {
            return false;
        }
    }



    private void createCode(HttpServerUtility Server,int survey_id,int num,string nr)
    {
        QRCodeEncoder qrCodeEncoder = new QRCodeEncoder();
        qrCodeEncoder.QRCodeEncodeMode = QRCodeEncoder.ENCODE_MODE.BYTE;
        qrCodeEncoder.QRCodeScale = 4;
        qrCodeEncoder.QRCodeVersion = 8;
        qrCodeEncoder.QRCodeErrorCorrect = QRCodeEncoder.ERROR_CORRECTION.M;
        //System.Drawing.Image image = qrCodeEncoder.Encode("4408810820 深圳－广州 小江");
        System.Drawing.Bitmap image = qrCodeEncoder.Encode(nr);

        string filename = num + ".jpg";
        if (!System.IO.Directory.Exists(Server.MapPath(@"~\Upload" + survey_id)))
        {
            System.IO.Directory.CreateDirectory(Server.MapPath(@"~\Upload" + survey_id));
        }
        string filepath = Server.MapPath(@"~\Upload") + survey_id + "\\" + filename;
        System.IO.FileStream fs = new System.IO.FileStream(filepath, System.IO.FileMode.OpenOrCreate, System.IO.FileAccess.Write);
        image.Save(fs, System.Drawing.Imaging.ImageFormat.Jpeg);

        fs.Close();
        image.Dispose();

    }





    public void doResponse(HttpContext context)
    {

        string RealFile = context.Server.MapPath(@"~\") + "qr.zip";//真实存在的文件
        if (!System.IO.File.Exists(RealFile))
        {
            context.Response.Write("服务器上该文件已被删除或不存在！"); return;
        }
        context.Response.Buffer = true;
        context.Response.Clear();
        context.Response.ContentType = "application/download";
        string downFile = System.IO.Path.GetFileName("qr.zip");//这里也可以随便取名
        string EncodeFileName = HttpUtility.UrlEncode(downFile, System.Text.Encoding.UTF8);//防止中文出现乱码
        context.Response.AddHeader("Content-Disposition", "attachment;filename=" + EncodeFileName + ";");
        context.Response.BinaryWrite(System.IO.File.ReadAllBytes(RealFile));//返回文件数据给客户端下载
        context.Response.Flush();
        context.Response.End();
    }
    
    
    
    
    
    
}