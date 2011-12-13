using System.Collections.Generic;

namespace PsakeSample.Dao
{
	public class ProductDao
	{
		public List<Product> GetAllProduct()
		{
			var result = new List<Product>
			             	{
			             		new Product {Name = "A", Price = 50m},
			             		new Product {Name = "B", Price = 100m},
								new Product {Name = "C", Price = 150m}
			             	};
			return result;
		}
	}
}
