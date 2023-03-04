using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace Pagination
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public static Model.LopushokShopEntities db = new Model.LopushokShopEntities();
        public MainWindow()
        {
            InitializeComponent();
            List<Model.ProductType> productTypes= new List<Model.ProductType>();
            productTypes.Add(new Model.ProductType() {  Title = "All" });
            productTypes.AddRange(db.ProductType.ToList());
            CBProductType.ItemsSource = productTypes;
            RefreshComboBox();
            RefreshButtons();
            RefreshPagination();
        }

        private void BLeft_Click(object sender, RoutedEventArgs e)
        {
            if (pageNumber == 0)
                return;
            pageNumber--;
            RefreshPagination();
        }

        private void BRight_Click(object sender, RoutedEventArgs e)
        {
            if (pageNumber >= users.Count / pageSize)
                return;
            pageNumber++;
            RefreshPagination();
        }
        int pageNumber = 0;
        int pageSize = 0;
        private void CBNumberWrite_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            pageSize = Convert.ToInt32(CBNumberWrite.SelectedItem.ToString());
            pageNumber = 0;
            RefreshButtons();
            RefreshPagination();
        }
        List<Model.Product> users = db.Product.ToList();
        private void RefreshPagination()
        {
            DGData.ItemsSource = null;
            users = db.Product.ToList();
            if (CBProductType.SelectedIndex != 0)
            {
                users = users.Where(c=>c.ProductTypeID == ((Model.ProductType)CBProductType.SelectedItem).ID).ToList();
            }
            DGData.ItemsSource = users.Skip((pageNumber - 1) * pageSize).Take(pageSize);
        }
        private void RefreshComboBox()
        {
            CBNumberWrite.Items.Add("20");
            CBNumberWrite.Items.Add("30");
            CBNumberWrite.Items.Add("50");
        }
        private void RefreshButtons()
        {
            WPNumber.Children.Clear();
            for (int i = 0; i < users.Count/pageSize; i++)
            {
                Button button = new Button();
                button.Content = i + 1;
                button.Margin = new Thickness(10);
                button.Height = 50;
                button.Width = 50;
                button.FontSize = 15;
                button.Click += PageButton_Click;
                WPNumber.Children.Add(button);
            }
        }

        private void PageButton_Click(object sender, RoutedEventArgs e)
        {
            Button button = (Button)sender;
            pageNumber = Convert.ToInt32(button.Content);
            RefreshPagination();
        }

        private void CBProductType_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            RefreshPagination();
        }
    }
}
