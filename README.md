# DAISY Metafile generator

This project is dedicated to the memory of my Father for whom it was originally developed.

Many blind or partially sighted people listen to audiobooks on
[DAISY](https://en.wikipedia.org/wiki/Digital_Accessible_Information_System) players.

The DAISY format consists of audio files in MP3 format and metadata in XML format.

There exists many audio files freely available on the internet, particularly
[LibriVox](https://librivox.org/) for which there is no corresponding DAISY versions.

This project was therefore produced to generate minimal DAISY metadata to allow collections
of audio files to be played on a DAISY player.

## Installation

These installation instructions have been tested on a Raspberry Pi running Raspberry Pi OS.
However it should work on other Linux systems, changing package manager as appropriate.

```
    sudo apt install python3 lame libmpg123-dev
    git clone https://github.com/Memotech-Bill/MakeDaisy.git
    cd MakeDaisy
    make
    sudo make install
```

## Creating a DAISY Book

1. Create a folder for the book (in this case "Book"). There should be no spaces in the
   folder name (use underscores). Change into that folder

   ```
   mkdir Book
   cd Book
   ```

2. Create two sub-folders, one for the original MP3s and one for the resulting DAISY book.

   ```
   mkdir Source
   mkdir Daisy
   ```

3. Download the audio files for the book into the "Source" folder.

4. If the files have **not** come from LibriVox, create a file named "daisy.txt" (in the "Book"
   folder) with the following format:

   ```
   Identifier: A unique reference for the book
   Title: Title of the book
   Creator: Creator of the book
   Publisher: Publisher of the book
   Rights: License for the book
   Source publisher: Publisher of the text version
   Source edition: Edition of the book
   Narrator: Name of the Narrator
   ```

   This file may also be created for LibriVox recordings, but suitable defaults are
   supplied automaticly in that case.

5. From the "Book" folder, run the command

   ```
   makedaisy [options] Source Daisy
   ```

   Replace the sub-folder names if you have used different ones.

   The following options may be specified:
   * `-ss` - A collection of short stories (instead of a single long story)
   * `-it` - Ignore "Track" tags in MP3 files
   * `-sf` - Sort files by file name

6. The program will create the DAISY metadata in the "Daisy" folder.

7. The program will use "lame" to transcode the MP3 file into the required DAISY format.
   This may take a while for a long book.

8. Once the program completes, copy the contents of the "Daisy" folder onto suitable
   media (CD or USB stick) for the DAISY player.

## Possible Enhancements

I no longer have the incentive to work on this, however it currently only produces the
minimum of DAISY metadata.

* By scanning the audio files, looking for pauses, it might be possible to add more
detailed DAISY navigation.

* The text of LibriVox books are usually available from [Project Gutenburg](https://www.gutenberg.org/).
It might be possible to add syncronised text and speech. A similar problem to speech-to-text
to obtain the timings, except that the text is known in advance.
