#!/usr/bin/env python
# coding: utf-8

# # Exercise 1
# 
# Write a function that will take in a string parameter and return a string in its
# equivalent Morse code.

# ### 1. Install a library that already handles morse code translation

# In[91]:


pip install morse-talk


# ### 2. Import the module to use it

# In[92]:


import morse_talk as morse


# ### 3. Define a function that uses the libraries capabilities

# In[93]:


def translate_english_to_morse(text):
    translated_text = morse.encode(text)
    return translated_text


# ### 4. Ask user for a word to translate

# In[94]:


text_to_translate = input("Please input a text to translate to Morse: ")


# ### 5. Translate and show the user the translated text

# In[95]:


translation = translate_english_to_morse(text_to_translate)
print("Your text in Morse is: "+translation)


# # Exercise 2
# 
# Write a function that takes in a string parameter and returns a list and a count
# of the unique letters in the string. (Uppercase and lowercase letters should not
# be counted as different letters and symbols should be ignored.)

# ### 1. Define the function

# In[96]:


def unique_letters(text):
    text = text.upper()
    unique_list = []
    for char in enumerate(text):
        if (char[1] in unique_list or not char[1].isalpha()):
            continue
        else:
            unique_list.append(char[1])
    return (unique_list, len(unique_list))


# ### 2. Ask the user for a phrase to analyze

# In[99]:


phrase = input("Please input a phrase so we can count the unique words: ")


# ### 3. Use the function and return the results

# In[100]:


user_unique_letters = unique_letters(phrase)
print("The unique letters of your phrase are: ")
print(user_unique_letters[0])
print("Your phrase has "+str(user_unique_letters[1])+" unique letters")


# In[ ]:




