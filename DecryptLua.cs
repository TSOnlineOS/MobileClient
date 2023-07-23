
using System.Diagnostics;
using System.Reflection;
using System.Security.Cryptography;
using System.Text;

namespace TestProject1
{
    public class UnitTest1
    {
        static void Main(string[] args)
        {
            foreach (string file in GetFiles(@"c:\temp"))
            {
                // Rest of the code goes here 
                Console.WriteLine(file);

                byte[] result;
                try
                {
                    byte[] bytes;
                    using (Rijndael rijndael = Rijndael.Create())
                    {
                        rijndael.Key = Encoding.UTF8.GetBytes("1234567870541704");
                        rijndael.IV = Encoding.UTF8.GetBytes("7054170412345678");
                        ICryptoTransform transform = rijndael.CreateDecryptor(rijndael.Key, rijndael.IV);
                        using (MemoryStream memoryStream = new MemoryStream(ReadAllBytes(file)))
                        {
                            using (CryptoStream cryptoStream = new CryptoStream(memoryStream, transform, CryptoStreamMode.Read))
                            {
                                using (StreamReader streamReader = new StreamReader(cryptoStream))
                                {
                                    bytes = Encoding.UTF8.GetBytes(streamReader.ReadToEnd());
                                }
                            }
                        }
                    }
                    result = bytes;
                    Console.WriteLine(result.Length);

                    FileStream f1;
                    f1 = new FileStream(file, FileMode.Create, FileAccess.Write);
                    f1.Write(bytes, 0, result.Length);
                    f1.Close();
                }
                catch (CryptographicException ex)
                {
                    result = null;
                }
            }
        }

        static IEnumerable<string> GetFiles(string path)
        {
            Queue<string> queue = new Queue<string>();
            queue.Enqueue(path);
            while (queue.Count > 0)
            {
                path = queue.Dequeue();
                try
                {
                    foreach (string subDir in Directory.GetDirectories(path))
                    {
                        queue.Enqueue(subDir);
                    }
                }
                catch (Exception ex)
                {
                    Console.Error.WriteLine(ex);
                }
                string[] files = null;
                try
                {
                    files = Directory.GetFiles(path);
                }
                catch (Exception ex)
                {
                    Console.Error.WriteLine(ex);
                }
                if (files != null)
                {
                    for (int i = 0; i < files.Length; i++)
                    {
                        yield return files[i];
                    }
                }
            }
        }

        static byte[] ReadAllBytes(string path)
        {
            byte[] result;
            using (FileStream fileStream = File.OpenRead(path))
            {
                long length = fileStream.Length;
                if (length > 2147483647L)
                {
                    throw new IOException("Reading more than 2GB with this call is not supported");
                }
                int num = 0;
                int i = (int)length;
                byte[] array = new byte[length];
                while (i > 0)
                {
                    int num2 = fileStream.Read(array, num, i);
                    if (num2 == 0)
                    {
                        throw new IOException("Unexpected end of stream");
                    }
                    num += num2;
                    i -= num2;
                }
                result = array;
            }
            return result;
        }
    }
}