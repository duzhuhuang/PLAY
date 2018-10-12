using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using System.Windows.Threading;


namespace Mario
{
    /// <summary>
    /// MainWindow.xaml 的交互逻辑
    /// </summary>
    public partial class MainWindow : Window
    {
        bool Go=true;
        bool boolj = true;
        int foward=1;
        int ac = 1;
        System.Windows.Threading.DispatcherTimer mo =new DispatcherTimer();
        public MainWindow()
        {
            InitializeComponent();
            mo.Interval = TimeSpan.FromSeconds(3);
            mo.Tick += new EventHandler(Mo);
            mo.Start();

        }
        public void Mo(object sender, EventArgs e)
        {
            if (ac == 3)
            {
                foward *= -1;
            }
            else
                ac++;
            var a = new Thread(mgo);
            a.Start();

        }
        void mgo() {
           
                for (int i = 200; i > 0; i--)
                {
                    this.Dispatcher.BeginInvoke((ThreadStart)(() =>
                    {
                        Thickness a = mosta.Margin;
                        a.Right += foward;
                        mosta.Margin = a;

                    }));
                    Thread.Sleep(8);
                }

           
        }
        private void Grid_KeyDown(object sender, KeyEventArgs e)
        {
            Display d = new Display();
          
        }



        void jump()
        {
            if (boolj)
            {
                boolj = false;
                for (int i = 200; i > 0; i--)
                {
                    this.Dispatcher.BeginInvoke((ThreadStart)(() =>
                    {
                        Thickness a = mario.Margin;
                        a.Bottom += 1;
                        mario.Margin = a;

                    }));
                    Thread.Sleep(8);
                }
                for (int i = 200; i > 0; i--)
                {
                    this.Dispatcher.BeginInvoke((ThreadStart)(() =>
                    {
                        Thickness a = mario.Margin;
                        a.Bottom -= 1;
                        mario.Margin = a;

                    }));
                    Thread.Sleep(5);
                }
                this.Dispatcher.BeginInvoke((ThreadStart)(() =>
                {
                    mario.Source = new BitmapImage(new Uri("img/mario.bmp", UriKind.Relative));

                }));
                boolj = true;
            }
        }

        

        void go()
        {
            if (Go)
            {
                Go = false;

                while (!Go)
                {
                    this.Dispatcher.BeginInvoke((ThreadStart)(() =>
                    {
                        Thickness a = mario.Margin;
                        a.Left += 3;
                        mario.Margin = a;

                    }));
                    Thread.Sleep(8);

                }
            }
        
            
        
        }
        void back()
        {

            if (Go)
            {
                Go = false;
                
                while (!Go)
                {
                    this.Dispatcher.BeginInvoke((ThreadStart)(() =>
                    {
                        Thickness a = mario.Margin;
                        a.Left -= 3;
                        mario.Margin = a;

                    }));
                    Thread.Sleep(8);
                }
              
            }
                
            
        }


        private void mario_MouseDown(object sender, MouseButtonEventArgs e)
        {
            mo.Start();
        }

        private void Window_KeyDown(object sender, KeyEventArgs e)
        {
            if (e.Key == Key.Space)
            {
                mario.Source = new BitmapImage(new Uri("img/marioj.bmp", UriKind.Relative));
                var ti = new Thread(jump);
                ti.Start();
               

            }

            else if (e.Key == Key.Right)
            {

                var ti = new Thread(go);
                ti.Start();


            }
            else if (e.Key == Key.Left)
            {

                var ti = new Thread(back);
                ti.Start();


            }
          

        }

        private void Window_KeyUp(object sender, KeyEventArgs e)
        {
           
               if(e.Key!=Key.Space) Go = true;
            
        }
    }
}
