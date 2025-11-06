using Microsoft.Extensions.Configuration;

namespace RemoveSingleInstanceCharacters
{
    internal class Program
    {
        private const string AppSettingsFileName = "appsettings.json";
        private const string CharactersSettingsName = "Characters";

        static void Main(string[] args)
        {
            IConfigurationRoot config = new ConfigurationBuilder()
                .AddJsonFile(AppSettingsFileName)
                .Build();
            string[]? characters = config.GetRequiredSection(CharactersSettingsName).Get<string[]>();

            foreach (string input in args ?? [])
            {
                Console.WriteLine(input.RemoveSingleInstanceCharacters(characters ?? []));
            }
        }
    }
}
