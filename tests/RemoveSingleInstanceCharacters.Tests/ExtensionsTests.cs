using Microsoft.VisualStudio.TestPlatform.MSTest.TestAdapter.ObjectModel;

namespace RemoveSingleInstanceCharacters.Tests
{
    [TestClass]
    public sealed class ExtensionsTests
    {
        private readonly string[] Characters = { "0", "2", "4", "6", "8" };

        [TestMethod]
        public void RemoveSingleInstanceCharactersSucceedsWhenEmpty()
        {
            // Arrange
            string str = string.Empty;

            // Act
            string output = str.RemoveSingleInstanceCharacters(Characters);

            // Assert
            Assert.AreEqual(str, output);
        }

        [TestMethod]
        public void RemoveSingleInstanceCharactersSucceedsWithNoChanges()
        {
            // Arrange
            string str = "22 Park Avenue";

            // Act
            string output = str.RemoveSingleInstanceCharacters(Characters);

            // Assert
            Assert.AreEqual(str, output);
        }

        [TestMethod]
        public void RemoveSingleInstanceCharactersSucceedsAtRemovingSingleCharacter()
        {
            // Arrange
            string str = "21 Park Avenue";
            string expected = "1 Park Avenue";

            // Act
            string output = str.RemoveSingleInstanceCharacters(Characters);

            // Assert
            Assert.AreEqual(expected, output);
        }
    }
}
