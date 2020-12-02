%% Experiment 12: RS Coding and Decoding

%{
     Name:- Smit Shah
     PRN:- 17070123090
     Batch:- EB2
     Date:- 30/11/2020
%}

% Tools/Software Required: MATLAB

%% Theory

%{
    Reed–Solomon codes are a group of error-correcting codes that were introduced by Irving S. Reed and Gustave Solomon in 1960. They have many applications, the most prominent of which include consumer technologies such as CDs, DVDs, Blu-ray discs, QR codes, data transmission technologies such as DSL and WiMAX, broadcast systems such as satellite communications, DVB and ATSC, and storage systems such as RAID 6. Reed–Solomon codes operate on a block of data treated as a set of finite-field elements called symbols. Reed–Solomon codes are able to detect and correct multiple symbol errors.

    The purpose of Reed-Solomon (RS) Encoder and Decoder is to correct burst errors in digital communication systems, broadcasting systems and digital storage devices using the technique of forward error correction. Forward error correction involves appending redundant or extra "parity symbols" to the original message at the transmitter end; so that these extra symbols may be used later for correcting errors at the receiver end. The Reed Solomon code is optimized for burst errors rather than bit errors. Burst errors are contiguous errors in a bit stream whereas bit errors refer to any individual bits in error in the data. Reed Solomon Encoder and Decoder serves as a compromise between efficiency and complexity, leading to its easy hardware implementation.
%}

%% Code and Result

clc % for clearing the command window
close all % for closing all the window except command window
clear all % for deleting all the variables from the memory

n=7; k=3; % Codeword and message word lengths
m=3; % Number of bits per symbol
msg = gf([5 2 3; 0 1 7;3 6 1],m) % Three k-symbol message words

% Message vector is defined over a Galois field where the number must range from 0 to 2^m-1
codedMessage = rsenc(msg,n,k)% Encoding the message vector using RS coding
dmin=n-k+1 % Display dmin
t=(dmin-1)/2 % Diplay error correcting capability of the code

% Generate noise - Add 2 contiguous symbol errors with first word; 2 symbol errors with second word and 3 distributed symbol errors to last word
noise=gf([0 0 0 2 3 0 0 ;6 0 1 0 0 0 0 ;5 0 6 0 0 4 0],m)
received = noise+codedMessage

% Decoded contains the decoded message and cnumerr contains the number of symbols errors corrected for each row. Also if cnumerr(i) = -1 it indicates that the ith row
contains unrecoverable error
[decoded,cnumerr] = rsdec(received,n,k)

%% Conclusion

%{
    Hence, we observed the encoded message, decoded message and noise for
    given 3 k-symbol message words.
%}