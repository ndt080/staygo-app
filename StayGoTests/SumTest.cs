using NUnit.Framework;

namespace StayGoTests
{
    public class Tests
    {
        [TestCase]
        public void AddTest()
        {
            Sum.HelperClass helper =new Sum.HelperClass();
            int result = helper.Add(20, 10);
            Assert.AreEqual(30, result);
        }
        [TestCase]
        public void SubtractTest()
        {
            Sum.HelperClass helper =new Sum.HelperClass();
            int result = helper.Subtract(999, 1);
            Assert.AreEqual(998, result);
        }
    }
}
