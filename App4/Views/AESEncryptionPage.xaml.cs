using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;

using Xamarin.Forms;
using Xamarin.Forms.Xaml;

namespace App4.Views
{
    [XamlCompilation(XamlCompilationOptions.Compile)]

    class StringEncryptionService
    {

        public string EncryptData(string textData, string Encryptionkey)
        {

            RijndaelManaged objrij = new RijndaelManaged();
            //set the mode for operation of the algorithm
            objrij.Mode = CipherMode.CBC;
            //set the padding mode used in the algorithm.
            objrij.Padding = PaddingMode.PKCS7;
            //set the size, in bits, for the secret key.
            objrij.KeySize = 0x80;
            //set the block size in bits for the cryptographic operation.
            objrij.BlockSize = 0x80;
            //set the symmetric key that is used for encryption & decryption.
            byte[] passBytes = Encoding.UTF8.GetBytes(Encryptionkey);
            //set the initialization vector (IV) for the symmetric algorithm
            byte[] EncryptionkeyBytes = new byte[] { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 };
            int len = passBytes.Length;
            if (len > EncryptionkeyBytes.Length)
            {
                len = EncryptionkeyBytes.Length;
            }
            Array.Copy(passBytes, EncryptionkeyBytes, len);
            objrij.Key = EncryptionkeyBytes;
            objrij.IV = EncryptionkeyBytes;
            //Creates symmetric AES object with the current key and initialization vector IV.
            ICryptoTransform objtransform = objrij.CreateEncryptor();
            byte[] textDataByte = Encoding.UTF8.GetBytes(textData);
            //Final transform the test string.
            return Convert.ToBase64String(objtransform.TransformFinalBlock(textDataByte, 0, textDataByte.Length));
        }
    }
        public partial class AESEncryptionPage : ContentPage
        {

        private void EncryptionAes(object sender, EventArgs e)
        {
            StringEncryptionService stringEncryptionService = new StringEncryptionService();
            string message = messageENC.Text;
            string key = PassKey.Text;

            if (string.IsNullOrWhiteSpace(message) || string.IsNullOrWhiteSpace(key))
            {
                outputLabel.Text = "Invalid Input";
            }
            else
            {
                outputLabel.Text = $"Encrypted: { stringEncryptionService.EncryptData(message, key)}";

            }
        }
        private void DecryptionAes(object sender, EventArgs e)
        {
            StringEncryptionService stringEncryptionService = new StringEncryptionService();
            string message = messageENC.Text;
            string key = PassKey.Text;

            if (string.IsNullOrWhiteSpace(message) || string.IsNullOrWhiteSpace(key))
            {
                outputLabel.Text = "Invalid Input";
            }
            else
            {
                outputLabel.Text = $"Decrypted: {message}";
            }
        }
        public AESEncryptionPage()
            {
                InitializeComponent();
            }
        }
    
}