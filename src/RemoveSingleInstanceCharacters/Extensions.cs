using System.Text;

namespace RemoveSingleInstanceCharacters
{
    public static class Extensions
    {
        /// <summary>
        /// Remove instances of single characters from the str.
        /// See <a href="https://github.com/SignalRichard/dotnet-console-interview-example/blob/main/spec/RemoveSingleInstanceCharacters/RemoveSingleInstanceCharacters.tla">RemoveSingleInstanceCharacters.tla</a> for reference specification.
        /// </summary>
        /// <param name="str"></param>
        /// <param name="characters"></param>
        /// <returns></returns>
        public static string RemoveSingleInstanceCharacters(this string str, IEnumerable<string> characters)
        {
            StringBuilder stringBuilder = new();
            string antepenultimate = string.Empty;
            string previous = string.Empty;
            string current = string.Empty;


            foreach (char c in str.ToCharArray())
            {
                current = c.ToString();

                if (!previous.Equals(string.Empty))
                {
                    if (!characters.Contains(previous) || characters.Contains(current))
                    {
                        stringBuilder.Append(previous);
                    }
                    else
                    {
                        if (characters.Contains(antepenultimate))
                        {
                            stringBuilder.Append(previous);
                        }
                    }
                }

                antepenultimate = previous;
                previous = current;
                current = string.Empty;
            }

            if (!previous.Equals(string.Empty))
            {
                if (!characters.Contains(previous) || characters.Contains(current))
                {
                    stringBuilder.Append(previous);
                }
                else
                {
                    if (characters.Contains(antepenultimate))
                    {
                        stringBuilder.Append(previous);
                    }
                }
            }

            return stringBuilder.ToString();
        }
    }
}
