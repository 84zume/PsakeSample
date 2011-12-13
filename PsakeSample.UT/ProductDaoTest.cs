using Microsoft.VisualStudio.TestTools.UnitTesting;
using PsakeSample.Dao;

namespace PsakeSample.UT
{
	[TestClass]
	public class ProductDaoTest
	{
		[TestMethod]
		public void GetAllProduct_Test()
		{
			var dao = new ProductDao();
			var result = dao.GetAllProduct();
			Assert.AreEqual("A", result[0].Name);
		}
	}
}
