using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Drawing;
using System.Drawing.Drawing2D;

namespace Mario
{
    class Display
    {
        public static Image MaskPic(string filename, params Point[] p)
        {
            //获取需要被蒙板的图片
            Image image = System.Drawing.Image.FromFile(filename);
            //建立一个蒙板一样大小的画布
            Bitmap bit = new Bitmap(image.Width, image.Height);
            //对这个空图片建立GDI+对象；
            System.Drawing.Graphics g = Graphics.FromImage(bit);
            //创建蒙板区域
            GraphicsPath gpath = new GraphicsPath();
            int len = p.Length;
            int flen = len / 4;
            for (int i = 0; i < flen; i++)
            {
                //以4个坐标画一个矩形显示区域
                Point[] point = { p[i * 4], p[i * 4 + 1], p[i * 4 + 2], p[i * 4 + 3] };
                gpath.AddPolygon(point);
                //设置画布显示区域【即设置蒙板区域】
                g.Clip = new Region(gpath);
            }
            //将被蒙板的图片绘制到空白画布上；
            g.DrawImage(image, 0, 0, image.Width, image.Height);
            return bit;
        }
    }
}
