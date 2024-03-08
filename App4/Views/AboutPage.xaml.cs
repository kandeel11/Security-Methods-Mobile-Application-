using System;
using System.ComponentModel;
using Xamarin.Forms;
using Xamarin.Forms.Xaml;

namespace App4.Views
{
    public partial class AboutPage : ContentPage
    {

        public AboutPage()
        {
            InitializeComponent();
        }
        private async void OnAESEncryptionClicked(object sender, EventArgs e)
        {
            await Navigation.PushAsync(new AESEncryptionPage());
        }
        private async void OnRSAEncryptionClicked(object sender, EventArgs e)
        {
            await Navigation.PushAsync(new RSAEncryptionPage());
        }
        private async void OnDESEncryptionClicked(object sender, EventArgs e)
        {
            await Navigation.PushAsync(new DESEncryptionPage());
        }
        private void OnEncryptClicked(object sender, EventArgs e)
        {
            string method = encryptionMethodPicker.SelectedItem.ToString();
            string message = messageEntry.Text;
            if (method == "Ceaser Cipher")
            {
                int shift = int.Parse(shiftEntry.Text);
                string encryptedMessage = CaesarCipherEncrypt(message, shift);
                outputLabel.Text = encryptedMessage;
            }
            else if (method == "Vigenère Cipher")
            {
                int x = message.Length;
                string key = keyEntry.Text;

                for (int i = 0; ; i++)
                {
                    if (x == i)
                        i = 0;
                    if (key.Length == message.Length)
                        break;
                    key += (key[i]);
                }
                // You can change the key
                string encryptedMessage = VigenereCipherEncrypt(message, key);
                outputLabel.Text = encryptedMessage;
            }
            else if (method == "RailFence Cipher")
            {
                int key = int.Parse(shiftEntry.Text);
                string encryptedMessage = EncryptRailFence(message, key);
                outputLabel.Text = encryptedMessage;
            }
        }
        private void OnDecryptClicked(object sender, EventArgs e)
        {
            string method = encryptionMethodPicker.SelectedItem.ToString();
            string message = messageEntry.Text;
            if (method == "Ceaser Cipher")
            {
                int shift = int.Parse(shiftEntry.Text); // You can change the 
                string encryptedMessage = CaesarCipherDecrypt(message, shift);
                outputLabel.Text = encryptedMessage;
            }
            else if (method == "Vigenère Cipher")
            {
                int x = message.Length;
                string key = keyEntry.Text;
                // You can change the key
                for (int i = 0; ; i++)
                {
                    if (x == i)
                        i = 0;
                    if (key.Length == message.Length)
                        break;
                    key += (key[i]);
                }
                string encryptedMessage = VigenereCipherdecrypt(message, key);
                outputLabel.Text = encryptedMessage;
            }
            else if (method == "RailFence Cipher")
            {
                int key = int.Parse(shiftEntry.Text); // You can change the key
                string encryptedMessage = DecryptRailFence(message, key);
                outputLabel.Text = encryptedMessage;
            }
        }
        ///////////////////////////////////
        private string CaesarCipherEncrypt(string text, int shift)
        {
            char[] charArray = text.ToCharArray();
            for (int i = 0; i < charArray.Length; i++)
            {

                int codePoint = charArray[i] + shift;
                if (char.IsSurrogate(charArray[i]))
                {
                    // Skip surrogate pairs
                    continue;
                }
                else if (char.IsHighSurrogate(charArray[i]) && i <
                charArray.Length - 1 && char.IsLowSurrogate(charArray[i + 1]))
                {
                    // Combine surrogate pairs
                    codePoint = char.ConvertToUtf32(charArray[i], charArray[i +
                    1]) + shift;
                    i++;
                }
                charArray[i] = (char)codePoint;
            }
            return new string(charArray);
        }
        ///////////////////////////////////
        private string CaesarCipherDecrypt(string text, int shift)
        {
            char[] charArray = text.ToCharArray();
            for (int i = 0; i < charArray.Length; i++)
            {
                int codePoint = charArray[i] - shift;
                if (char.IsSurrogate(charArray[i]))
                {
                    // Skip surrogate pairs
                    continue;
                }
                else if (char.IsHighSurrogate(charArray[i]) && i <
                charArray.Length - 1 && char.IsLowSurrogate(charArray[i + 1]))
                {
                    // Combine surrogate pairs
                    codePoint = char.ConvertToUtf32(charArray[i], charArray[i +
                    1]) - shift;
                    i++;
                }
                charArray[i] = (char)codePoint;
            }
            return new string(charArray);

        }
        private string VigenereCipherEncrypt(string text, string key)
        {
            string cipher_text = "";
            for (int i = 0; i < text.Length; i++)
            {
                char currentChar = text[i];
                char currentKey = key[i % key.Length];

                if (char.IsLetter(currentChar))
                {
                    char baseChar = char.IsLower(currentChar) ? 'a' : 'A';
                    int charOffset = char.IsLower(currentChar) ? 'a' : 'A';
                    // Convert currentChar and currentKey to the 0-25 range
                    int x = (currentChar - charOffset + currentKey - 'a') % 26;
                    // Convert back to ASCII range and append to cipher_text
                    cipher_text += (char)(x + charOffset);
                }
                else
                {
                    // If the character is not a letter, leave it unchanged
                    cipher_text += currentChar;
                }
            }
            return cipher_text;
        }
        private string VigenereCipherdecrypt(string text, string key)
        {
            string plainText = "";
            for (int i = 0; i < text.Length; i++)
            {
                char currentChar = text[i];
                char currentKey = key[i % key.Length];
                if (char.IsLetter(currentChar))
                {
                    char baseChar = char.IsLower(currentChar) ? 'a' : 'A';
                    int charOffset = char.IsLower(currentChar) ? 'a' : 'A';
                    int x = (currentChar - charOffset - (currentKey - 'a') + 26)
                    % 26;
                    plainText += (char)(x + charOffset);
                }

                else
                {
                    plainText += currentChar;
                }
            }
            return plainText;
        }

        private string EncryptRailFence(string text, int key)
        {
            char[,] rail = new char[key, text.Length];
            for (int i = 0; i < key; i++)
                for (int j = 0; j < text.Length; j++)
                    rail[i, j] = '\n';
            bool dirDown = false;
            int row = 0, col = 0;
            for (int i = 0; i < text.Length; i++)
            {
                if (row == 0 || row == key - 1)
                    dirDown = !dirDown;
                rail[row, col++] = text[i];
                if (dirDown)
                    row++;
                else
                    row--;
            }
            string result = "";
            for (int i = 0; i < key; i++)
                for (int j = 0; j < text.Length; j++)
                    if (rail[i, j] != '\n')
                        result += rail[i, j];
            return result;
        }
        
        private string DecryptRailFence(string cipher, int key)

        {
            char[,] rail = new char[key, cipher.Length];
            for (int i = 0; i < key; i++)
                for (int j = 0; j < cipher.Length; j++)
                    rail[i, j] = '\n';
            // to find the direction
            bool dirDown = true;
            int row = 0, col = 0;
            // mark the places with '*'
            for (int i = 0; i < cipher.Length; i++)
            {
                // check the direction of flow
                if (row == 0)
                    dirDown = true;
                if (row == key - 1)
                    dirDown = false;
                // place the marker
                rail[row, col++] = '*';
                // find the next row using direction flag
                if (dirDown)
                    row++;
                else
                    row--;
            }
            // now we can construct the fill the rail matrix
            int index = 0;
            for (int i = 0; i < key; i++)
                for (int j = 0; j < cipher.Length; j++)
                    if (rail[i, j] == '*' && index < cipher.Length)
                        rail[i, j] = cipher[index++];
            // create the result string
            string result = "";
            row = 0;
            col = 0;
            // iterate through the rail matrix
            for (int i = 0; i < cipher.Length; i++)
            {
                // check the direction of flow
                if (row == 0)
                    dirDown = true;
                if (row == key - 1)
                    dirDown = false;
                // place the marker

                if (rail[row, col] != '*')
                    result += rail[row, col++];
                // find the next row using direction flag
                if (dirDown)
                    row++;
                else
                    row--;
            }
            return result;
        }


    }
        
    
}
