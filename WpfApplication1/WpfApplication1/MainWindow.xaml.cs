using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using AForge.Video.DirectShow;
using System.Windows.Threading;
using System.Runtime.InteropServices;
using System.Net;
using System.IO;

using System.Drawing;
using System.Threading;
namespace WpfApplication1
{
    /// <summary>
    /// MainWindow.xaml 的交互逻辑
    /// </summary>
    public partial class MainWindow : Window
    {
        VideoCaptureDevice Camera;

        public MainWindow()
        {
            InitializeComponent();
            play();
        }
        void play()
        {
            FilterInfoCollection Cameras = new FilterInfoCollection(FilterCategory.VideoInputDevice);
            if (Cameras.Count != 0)
            {
                try
                {
                    //取出对应索引的摄像头对象
                    Camera = new VideoCaptureDevice(Cameras[0].MonikerString);
                    //摄像头帧事件
                    Camera.NewFrame += new AForge.Video.NewFrameEventHandler(Camera_NewFrame);
                   
                        Camera.DesiredFrameSize = new System.Drawing.Size(720,0);
                    Camera.DesiredFrameRate = 15;
                    Camera.Start();
                }
                catch (Exception E)
                {
                    Console.WriteLine(E);
                }

            }
        }
        void Camera_NewFrame(object sender, AForge.Video.NewFrameEventArgs eventArgs)
        {
            try
            {
                System.Drawing.Bitmap bmp = (System.Drawing.Bitmap)eventArgs.Frame.Clone();

              

                this.Dispatcher.BeginInvoke((Action)(() =>
                {
                    //将摄像头bitmap数据转为BitmapSource数据  赋值到Image控件 在界面上显示
                    cam.Source = BitmapToSource(bmp);
                    
                }), DispatcherPriority.Send, null);
                GC.Collect();
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
            }
        }
        private BitmapSource BitmapToSource(System.Drawing.Bitmap bmp)
        {
            BitmapSource bmpSource;
            IntPtr ptr = IntPtr.Zero;
            try
            {
                ptr = bmp.GetHbitmap();
                bmpSource = System.Windows.Interop.Imaging.CreateBitmapSourceFromHBitmap(ptr, IntPtr.Zero, Int32Rect.Empty, BitmapSizeOptions.FromEmptyOptions());
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
                bmpSource = null;
            }
            finally
            {
                DeleteObject(ptr);
            }
            return bmpSource;
        }


        [DllImport("gdi32")]
        static extern int DeleteObject(IntPtr p);
        private void Button_Click(object sender, RoutedEventArgs e)
        {
            TransformGroup g = cam.RenderTransform as TransformGroup;
            RotateTransform R = g.Children[2] as RotateTransform;
            R.Angle += 180;
            
        }

        private void Button_Click2(object sender, RoutedEventArgs e)
        {
            
            //Foundation.Http.HttpGet
            string path = string.Format(@"D:\{0}.jpg", DateTime.Now.Ticks.ToString());
            try
            {
                using (System.Drawing.Bitmap bitmap = new Bitmap((int)this.Width, (int)this.Height, System.Drawing.Imaging.PixelFormat.Format32bppRgb))
                {
                    using (Graphics g = Graphics.FromImage(bitmap))
                    {
                        g.CopyFromScreen((int)this.Left, (int)this.Top, 0, 0, new System.Drawing.Size((int)SystemParameters.PrimaryScreenWidth, (int)SystemParameters.PrimaryScreenHeight), System.Drawing.CopyPixelOperation.SourceCopy);

                        //bitmap.Save(PhotoDefault, System.Drawing.Imaging.ImageFormat.Jpeg);
                        //保存至物理文件
                        bitmap.Save(path, System.Drawing.Imaging.ImageFormat.Jpeg);
                    }
                    //using (System.Drawing.Image im = new Bitmap(bitmap, bitmap.Width / 2, bitmap.Height / 2))
                    //{
                    //    im.Save(path, System.Drawing.Imaging.ImageFormat.Jpeg);
                    //}
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
            }
            string[] message =tsJSON( detect(path));
            String MS="";
            for (int i = 0; i < message.Length; i++) {
                MS = MS + message[i] + "\n";
            }
            MessageBox.Show(MS);
            
        }
       
        public  string detect(string name)
        {
            string token = "24.1aea815ec79e0551ec734e79fc5ab2c5.2592000.1541835291.282335-14398200";
            string host = "https://aip.baidubce.com/rest/2.0/face/v3/detect?access_token=" + token;
            Encoding encoding = Encoding.Default;
            HttpWebRequest request = (HttpWebRequest)WebRequest.Create(host);
            request.Method = "post";
            request.KeepAlive = true;
            string base64 = Convert.ToBase64String(System.IO.File.ReadAllBytes(name));
            String str = "{\"image\":\""+base64+ "\",\"image_type\":\"BASE64\",\"face_field\":\"age,beauty,expression,gender\"}";
            byte[] buffer = encoding.GetBytes(str);
            request.ContentLength = buffer.Length;
            request.GetRequestStream().Write(buffer, 0, buffer.Length);
            HttpWebResponse response = (HttpWebResponse)request.GetResponse();
            StreamReader reader = new StreamReader(response.GetResponseStream(), Encoding.Default);
            string result = reader.ReadToEnd();
            Console.WriteLine("人脸检测与属性分析:");
            Console.WriteLine(result);

            return result;
        }
        string[] tsJSON(string json) {
            string[] obj=json.Split(',');
            string []RS = new string[4];
             RS[0]="年龄："+obj[16].Split(':')[1];
            double va=Double.Parse( obj[17].Split(':')[1])+10;
            RS[1] = "颜值：" +va.ToString() ;
            switch (obj[18].Split(':')[2]) {
                case "\"none\"":
                    RS[2] = "表情：" + "不笑";
                    break;
                case "\"smile\"":
                    RS[2] = "表情：" + "微笑";
                    break;
                case "\"laugh\"":
                    RS[2] = "表情：" + "大笑";
                    break;
            }
        if (obj[20].Split(':')[2]=="\"male\"")
            RS[3] = "性别：" +"男";
        else
                RS[3] = "性别：" + "女";
            return RS;
        }
    }
}
