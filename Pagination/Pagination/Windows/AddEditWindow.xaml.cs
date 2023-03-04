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
using System.Windows.Shapes;

namespace Pagination.Windows
{
    /// <summary>
    /// Interaction logic for AddEditWindow.xaml
    /// </summary>
    public partial class AddEditWindow : Window
    {
        Model.Product postProduct;
        public AddEditWindow(Model.Product product)
        {
            InitializeComponent();
            postProduct = product;
            this.DataContext = postProduct;
            CBProductType.ItemsSource = MainWindow.db.ProductType.ToList();
            if (postProduct.ID == 0)
                BDelete.Visibility = Visibility.Collapsed;
        }

        private void BSave_Click(object sender, RoutedEventArgs e)
        {
            if (postProduct.ID == 0)
                MainWindow.db.Product.Add(postProduct);
            MainWindow.db.SaveChanges();
            this.Close();
        }

        private void BDelete_Click(object sender, RoutedEventArgs e)
        {
            MainWindow.db.Product.Remove(MainWindow.db.Product.FirstOrDefault(c=>c.ID == postProduct.ID));
            MainWindow.db.SaveChanges();
            MessageBox.Show("Succes Deleted");
            this.Close();
        }
    }
}
