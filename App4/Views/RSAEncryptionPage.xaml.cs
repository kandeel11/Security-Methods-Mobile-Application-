using System;
using System.Collections.Generic;
using System.Linq;
using System.Numerics;
using System.Security.Cryptography.X509Certificates;
using System.Text;
using System.Threading.Tasks;

using Xamarin.Forms;
using Xamarin.Forms.Xaml;

namespace App4.Views
{
    [XamlCompilation(XamlCompilationOptions.Compile)]
    public partial class RSAEncryptionPage : ContentPage
    {
       
        private static int? n = null;
        public RSAEncryptionPage()
        {
            InitializeComponent();
        }
        /*this code will genrate e in 
         * 
         */

        private void GCD(object sender, EventArgs e)
        {
            double P = double.Parse(P_Entry.Text);
            double Q = double.Parse(Q_Entry.Text);
            double phi = (P - 1) * (Q - 1);
            E_Entry.Text= GeneratePrimitiveRoot(Convert.ToInt32(phi)).ToString();
            // The user's input for key or shift
        }
        // here code to encrypt and decrypt
       
        public static void SetKeys()
        {
            
        }
       
        public static int GCD(int a, int b)
        {
            if (b == 0)
            {
                return a;
            }
            return GCD(b, a % b);
        }

        public static int Encrypt(int message, int? public_key)
        {
            int e = public_key.Value;
            int encrypted_text = 1;
            while (e > 0)
            {
                encrypted_text *= message;
                encrypted_text %= n.Value;
                e -= 1;
            }
            return encrypted_text;
        }
       
        public static int Decrypt(int encrypted_text, int? private_key)
        {
            int d = private_key.Value;
            int decrypted = 1;
            while (d > 0)
            {
                decrypted *= encrypted_text;
                decrypted %= n.Value;
                d -= 1;
            }
            return decrypted;
        }

        public static List<int> Encoder(string message, int? p)
        {
            List<int> encoded = new List<int>();
            foreach (char letter in message)
            {
                encoded.Add(Encrypt((int)letter,p));
            }
            return encoded;
        }

        public static string Decoder(List<int> encoded, int? r)
        {
            string s = "";
            foreach (int num in encoded)
            {
                s += (char)Decrypt(num,r);
            }
            return s;
        }

        private void Encrypt(object sender, EventArgs e)
        {
            string message = messageENC.Text;
            int? public_key = null;
            int? private_key = null;
            int prime1 = int.Parse(P_Entry.Text);
            int prime2 = int.Parse(Q_Entry.Text);

            n = prime1 * prime2;
            int fi = (prime1 - 1) * (prime2 - 1);

            int F = int.Parse(E_Entry.Text);
            if (IsPrime(prime1) && IsPrime(prime2) && IsPrime(F))
            {
                while (true)
                {
                    if (GCD(F, fi) == 1)
                    {
                        break;
                    }
                    F += 1;
                }

                public_key = F;

                int d = 2;
                while (true)
                {
                    if ((d * F) % fi == 1)
                    {
                        break;
                    }
                    d += 1;
                }

                private_key = d;
                List<int> coded = Encoder(message, public_key);
                messageDEC.Text = string.Join("", coded);
                outputLabel.Text = string.Join("", coded);

            }
            else
            {
                outputLabel.Text = "you select Not Prime numbers ";
               
            }
        }
        public static bool IsPrime(int number)
        {
            if (number <= 1) return false;
            if (number == 2) return true;
            if (number % 2 == 0) return false;

            var boundary = (int)Math.Floor(Math.Sqrt(number));

            for (int i = 3; i <= boundary; i += 2)
                if (number % i == 0)
                    return false;

            return true;
        }

        private void Decrypt(object sender, EventArgs e)
        {
            string message = messageENC.Text;
            int? public_key = null;
            int? private_key = null;
            int prime1 = int.Parse(P_Entry.Text);
            int prime2 = int.Parse(Q_Entry.Text);
            int F = int.Parse(E_Entry.Text);
            if (!IsPrime(prime1) && !IsPrime(prime2) && !IsPrime(F))
            {
                outputLabel.Text = "you select Not Prime numbers ";
            }
            else
            {
                n = prime1 * prime2;
                int fi = (prime1 - 1) * (prime2 - 1);
                while (true)
                {
                    if (GCD(F, fi) == 1)
                    {
                        break;
                    }
                    F += 1;
                }
                public_key = F;
                int d = 2;
                while (true)
                {
                    if ((d * F) % fi == 1)
                    {
                        break;
                    }
                    d += 1;
                }
                private_key = d;
                List<int> coded = Encoder(message, public_key);
                outputLabel.Text = $"Public key: {F}  , {n}  \n";
                outputLabel.Text += $"private key: {d}  , {n}  \n";
                outputLabel.Text += Decoder(coded, private_key);
            }
        }


        static int GeneratePrimitiveRoot(int n)
        {
            // Calculate Euler's totient function of n
            int phiN = Phi(n);
            int[] factors = new int[phiN];
            int numFactors = 0;
            int temp = phiN;

            // Get all prime factors of phi(n)
            for (int i = 2; i <= Math.Sqrt(temp); i++)
            {
                if (temp % i == 0)
                {
                    factors[numFactors++] = i;
                    while (temp % i == 0)
                    {
                        temp /= i;
                    }
                }
            }
            if (temp > 1)
            {
                factors[numFactors++] = temp;
            }

            // Test possible primitive roots
            for (int i = 2; i <= n; i++)
            {
                bool isRoot = true;
                for (int j = 0; j < numFactors; j++)
                {
                    // Check if i is a primitive root modulo n
                    if (modpow(i, phiN / factors[j], n) == 1)
                    {
                        isRoot = false;
                        break;
                    }
                }
                if (isRoot)
                {
                    return i; // i is a primitive root modulo n
                }
            }

            return -1; // No primitive root found
        }

        static int Phi(int n)
        {
            int result = n;
            for (int p = 2; p * p <= n; ++p)
            {
                if (n % p == 0)
                {
                    while (n % p == 0)
                    {
                        n /= p;
                    }
                    result -= result / p;
                }
            }
            if (n > 1)
            {
                result -= result / n;
            }
            return result;
        }

        static int modpow(int a, int b, int m)
        {
            int result = 1;
            while (b > 0)
            {
                if ((b & 1) == 1)
                {
                    result = (result * a) % m;
                }
                a = (a * a) % m;
                b >>= 1;
            }
            return result;
        }

        /*////////////////
         */

        public static double gcd(double a, double h)
        {
            /*
             * This function returns the gcd or greatest common
             * divisor
             */
            double temp;
            while (true)
            {
                temp = a % h;
                if (temp == 0)
                    return h;
                a = h;
                h = temp;
            }
        }
    }
}