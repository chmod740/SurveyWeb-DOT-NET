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
        
        
        
        context.Response.ContentType = "text/plain";
        context.Response.Write("Hello World");
        
        
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
}