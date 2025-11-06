using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Text;
using System.Threading.Tasks;

namespace RemoveSingleInstanceCharacters
{
    public static class Extensions
    {
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
