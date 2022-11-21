from tkinter import *
import random
from ttkthemes import *
from tkinter import ttk
import string
import time
import threading

# Functionality Part

t = 0  # initial time
totalTime = 60  # Total time
wrongWords = 0
totalWords = 0


def timer():
    global t, wrongWords
    textArea.config(state=NORMAL)
    textArea.focus_set()
    startButton.config(state=DISABLED)

    for t in range(1, 61):
        elapsed_time_Label.config(text=t)

        remainingTime = totalTime - t
        remaining_time_Label.config(text=remainingTime)

        root.update()
        time.sleep(1)

    resetButton.config(state=NORMAL)
    totalWords = len(textArea.get(0.0, END).split())
    total_Words_count_Label.config(text=totalWords)
    textarea_words = textArea.get(0.0, END).split()
    label_paragraph_words = paragraphLabel['text'].split()
    for pair in list(zip(textarea_words, label_paragraph_words)):
        if pair[0] != pair[1]:
            wrongWords += 1

    wrong_word_count_Label.config(text=wrongWords)
    wpm = totalWords - wrongWords
    word_per_minute_count_Label.config(text=wpm)

    accuracy = wpm / totalWords * 100
    accu = str(round(accuracy))
    accuracy_count_Label.config(text=accu + '%')


def start():
    t1 = threading.Thread(target=timer)
    t1.start()


root = ThemedTk()
root.get_themes()
root.set_theme('radiance')
root.title("Typing Master App created by Raashid.")
root.geometry('933x725+200+20')
root.resizable(False, False)

titleFrame = Frame(root, bg="green", bd=4)
titleFrame.grid()

titleLabel = Label(titleFrame, text='Master Typing', font=('Times New Roman', 45, 'bold',), bg='#101329', fg='white', width=38, bd=10)
titleLabel.grid()

paragraphFrame = Frame(root)
paragraphFrame.grid(row=1, column=0, pady=2)

paragraphList = [
    'I failed the first quarter of a class in middle school, so I made a fake report card. I did this every quarter that year. I forgot that they mail home the end-of-year cards, and my mom got it before I could intercept with my fake. She was PISSED at the school for their error. The teacher also retired that year and had already thrown out his records, so they had to take my mother’s “proof” (the fake ones I made throughout the year) and “correct” the “mistake.” ',

    'In my junior year of high school, this guy asked me on a date. He rented a red box movie and made a pizza. We were watching the movie and the oven beeped so the pizza was done. He looked me dead in the eye and said, “This is the worst part.” I then watched this boy open the oven and pull the pizza out with his bare hands, rack and all, screaming at the top of his lungs. We never had a second date.Ok so then what is i cannot tell you because that did not happen.',

    'I went to this girl’s party the week after she beat the shit out of my friend. While everyone was getting trashed, I went around putting tuna inside all the curtain rods and so like weeks went by and they could not figure out why the house smelled like festering death. They caught me through this video where these guys at the party were singing Beyonce while I was in the background with a can of tuna.This is what happened in this short funny story if you like.',

    'One time way back in sixth grade math class I had to fart really bad. Me being the idiot that I am decided that it would be silent. Big surprise it was not. The only person talking was the teacher and she was interrupted by freaking cannon fire farts. She said she was disappointed I could not hold it in and proceeded to tell a story of how she taught a famous athlete who did nearly the same thing.I felt ashamed then everyone laughed and at the end I also laughed.',

    'So a couple weeks ago, me and my friends were sitting on this cement kind of pedestal (as we called it) It’s basically the steps up to the portable. (classroom that no one uses) and this weird supply French teacher comes up to us and says: you should not be sitting on this ground, it’s too cold and it’s bad for your ovaries. I asked her how or why and she said that if children sit on cold ground their ovaries will freeze and that we won’t be able to have kids.',

    'One of the most valuable possession of human life is its health. With good health, one can attain everything in life. In order to perform an important work effectively, one has to be in sound health. Nowadays, everyone is suffering from some sort of mental, health, chronic or physical illness, which however deprives them. Often bad habits such as smoking have brought upon diseases and weakness upon a person which he is not aware of and are of no value to their family and society.',

    'Alcohol is taken in almost all cool and cold climates, and to a very much less extent in hot ones. It is taken by people who live in the Himalaya Mountains, but not nearly so much by those who live in the plains of India. Alcohol is not necessary in any way to anybody. The regular use of alcohol, even in small quantities, tends to cause mischief in many ways to various organs of the body. It affects the liver, it weakens the mental powers, and lessens the energy of the body.',

    'The Computer is an automatic device that performs mathematical calculations and logical operations. They are being put to use in widely divergent fields such as book-keeping, spaceflight controls, passenger reservation service, language translation etc. There are two categories: analog and digital. The former represents numbers by some physical quantity such as length, angular relation or electric current whereas the latter represent numbers by separate devices for each digit.'
]
random.shuffle(paragraphList)
paragraphLabel = Label(paragraphFrame, text=paragraphList[0], wraplength=912, justify="left",
                       font=('Arial', 18, 'bold'))
paragraphLabel.grid()

textFrame = Frame(root)
textFrame.grid(row=2, column=0)
textArea = Text(textFrame, font=('Arial', 14, 'bold'), width=113, height=8, wrap='word', bd=4, relief=GROOVE,
                state=DISABLED)
textArea.grid()

outputFrame = Frame(root)
outputFrame.grid(row=3, column=0, pady=2)

elapsed_time_Label = Label(outputFrame, text='Elapsed Time', fg='green', font=('', 14, 'bold'))
elapsed_time_Label.grid(row=0, column=0)

elapsed_time_Label = Label(outputFrame, text='0', fg='#101329', font=('', 14, 'bold'))
elapsed_time_Label.grid(row=0, column=1, padx=5)

remaining_time_Label = Label(outputFrame, text='Remaining Time', fg='green', font=('', 14, 'bold'))
remaining_time_Label.grid(row=0, column=2, padx=5)

remaining_time_Label = Label(outputFrame, text='60 sec', fg='#101329', font=('', 14, 'bold'))
remaining_time_Label.grid(row=0, column=3, padx=5)

word_per_minute_Label = Label(outputFrame, text='WPM', fg='green', font=('', 14, 'bold'))
word_per_minute_Label.grid(row=0, column=4, padx=5)

word_per_minute_count_Label = Label(outputFrame, text='0', fg='#101329', font=('', 14, 'bold'))
word_per_minute_count_Label.grid(row=0, column=5, padx=5)

accuracy_Label = Label(outputFrame, text='Accuracy', fg='green', font=('', 14, 'bold'))
accuracy_Label.grid(row=0, column=6, padx=5)

accuracy_count_Label = Label(outputFrame, text='0%', fg='#101329', font=('', 14, 'bold'))
accuracy_count_Label.grid(row=0, column=7, padx=5)

total_Words_Label = Label(outputFrame, text='Total Words', fg='green', font=('', 14, 'bold'))
total_Words_Label.grid(row=0, column=8, padx=5)

total_Words_count_Label = Label(outputFrame, text='0', fg='#101329', font=('', 14, 'bold'))
total_Words_count_Label.grid(row=0, column=9, padx=5)

wrong_word_Label = Label(outputFrame, text='Wrong Word', fg='green', font=('', 14, 'bold'))
wrong_word_Label.grid(row=0, column=10, padx=5)

wrong_word_count_Label = Label(outputFrame, text='0', fg='#101329', font=('', 14, 'bold'))
wrong_word_count_Label.grid(row=0, column=11, padx=5)

buttonFrame = Frame(root)
buttonFrame.grid(row=4, column=0, pady=2)

startButton = ttk.Button(buttonFrame, text='Start', command=start)
startButton.grid(row=0, column=0, padx=10)

resetButton = ttk.Button(buttonFrame, text='Reset', state=DISABLED)
resetButton.grid(row=0, column=1, padx=10)

exitButton = ttk.Button(buttonFrame, text='Exit', command=root.destroy)
exitButton.grid(row=0, column=2, padx=10)

keyboardFrame = Frame(root)
keyboardFrame.grid(row=5, column=0)

frame1to0 = Frame(keyboardFrame)
frame1to0.grid(row=0, column=0, pady=5)

label1 = Label(frame1to0, text='1', bg='#101329', fg='white', bd=10, width=3, height=2, font=('arial', 10, 'bold'),
               relief=GROOVE)
label1.grid(row=0, column=0, padx=5)

label2 = Label(frame1to0, text='2', bg='#101329', fg='white', bd=10, width=3, height=2, font=('arial', 10, 'bold'),
               relief=GROOVE)
label2.grid(row=0, column=1, padx=5)

label3 = Label(frame1to0, text='3', bg='#101329', fg='white', bd=10, width=3, height=2, font=('arial', 10, 'bold'),
               relief=GROOVE)
label3.grid(row=0, column=2, padx=5)

label4 = Label(frame1to0, text='4', bg='#101329', fg='white', bd=10, width=3, height=2, font=('arial', 10, 'bold'),
               relief=GROOVE)
label4.grid(row=0, column=3, padx=5)

label5 = Label(frame1to0, text='5', bg='#101329', fg='white', bd=10, width=3, height=2, font=('arial', 10, 'bold'),
               relief=GROOVE)
label5.grid(row=0, column=4, padx=5)

label6 = Label(frame1to0, text='6', bg='#101329', fg='white', bd=10, width=3, height=2, font=('arial', 10, 'bold'),
               relief=GROOVE)
label6.grid(row=0, column=5, padx=5)

label7 = Label(frame1to0, text='7', bg='#101329', fg='white', bd=10, width=3, height=2, font=('arial', 10, 'bold'),
               relief=GROOVE)
label7.grid(row=0, column=6, padx=5)

label8 = Label(frame1to0, text='8', bg='#101329', fg='white', bd=10, width=3, height=2, font=('arial', 10, 'bold'),
               relief=GROOVE)
label8.grid(row=0, column=7, padx=5)

label9 = Label(frame1to0, text='9', bg='#101329', fg='white', bd=10, width=3, height=2, font=('arial', 10, 'bold'),
               relief=GROOVE)
label9.grid(row=0, column=8, padx=5)

label0 = Label(frame1to0, text='0', bg='#101329', fg='white', bd=10, width=3, height=2, font=('arial', 10, 'bold'),
               relief=GROOVE)
label0.grid(row=0, column=9, padx=5)

frameQtoP = Frame(keyboardFrame)
frameQtoP.grid(row=1, column=0, pady=5)

labelQ = Label(frameQtoP, text='Q', bg='#101329', fg='white', bd=10, width=2, height=2, font=('arial', 10, 'bold'),
               relief=GROOVE)
labelQ.grid(row=0, column=0, padx=5)

labelW = Label(frameQtoP, text='W', bg='#101329', fg='white', bd=10, width=2, height=2, font=('arial', 10, 'bold'),
               relief=GROOVE)
labelW.grid(row=0, column=1, padx=5)

labelE = Label(frameQtoP, text='E', bg='#101329', fg='white', bd=10, width=2, height=2, font=('arial', 10, 'bold'),
               relief=GROOVE)
labelE.grid(row=0, column=2, padx=5)

labelR = Label(frameQtoP, text='R', bg='#101329', fg='white', bd=10, width=2, height=2, font=('arial', 10, 'bold'),
               relief=GROOVE)
labelR.grid(row=0, column=3, padx=5)

labelT = Label(frameQtoP, text='T', bg='#101329', fg='white', bd=10, width=2, height=2, font=('arial', 10, 'bold'),
               relief=GROOVE)
labelT.grid(row=0, column=4, padx=5)

labelY = Label(frameQtoP, text='Y', bg='#101329', fg='white', bd=10, width=2, height=2, font=('arial', 10, 'bold'),
               relief=GROOVE)
labelY.grid(row=0, column=5, padx=5)

labelU = Label(frameQtoP, text='U', bg='#101329', fg='white', bd=10, width=2, height=2, font=('arial', 10, 'bold'),
               relief=GROOVE)
labelU.grid(row=0, column=6, padx=5)

labelI = Label(frameQtoP, text='I', bg='#101329', fg='white', bd=10, width=2, height=2, font=('arial', 10, 'bold'),
               relief=GROOVE)
labelI.grid(row=0, column=7, padx=5)

labelO = Label(frameQtoP, text='O', bg='#101329', fg='white', bd=10, width=2, height=2, font=('arial', 10, 'bold'),
               relief=GROOVE)
labelO.grid(row=0, column=8, padx=5)

labelP = Label(frameQtoP, text='P', bg='#101329', fg='white', bd=10, width=2, height=2, font=('arial', 10, 'bold'),
               relief=GROOVE)
labelP.grid(row=0, column=9, padx=5)

frameAtoL = Frame(keyboardFrame)
frameAtoL.grid(row=2, column=0, pady=5)

labelA = Label(frameAtoL, text='A', bg='#101329', fg='white', bd=10, width=2, height=2, font=('arial', 10, 'bold'),
               relief=GROOVE)
labelA.grid(row=0, column=0, padx=5)

labelS = Label(frameAtoL, text='S', bg='#101329', fg='white', bd=10, width=2, height=2, font=('arial', 10, 'bold'),
               relief=GROOVE)
labelS.grid(row=0, column=1, padx=5)

labelD = Label(frameAtoL, text='D', bg='#101329', fg='white', bd=10, width=2, height=2, font=('arial', 10, 'bold'),
               relief=GROOVE)
labelD.grid(row=0, column=2, padx=5)

labelF = Label(frameAtoL, text='F', bg='#101329', fg='white', bd=10, width=2, height=2, font=('arial', 10, 'bold'),
               relief=GROOVE)
labelF.grid(row=0, column=3, padx=5)

labelG = Label(frameAtoL, text='G', bg='#101329', fg='white', bd=10, width=2, height=2, font=('arial', 10, 'bold'),
               relief=GROOVE)
labelG.grid(row=0, column=4, padx=5)

labelH = Label(frameAtoL, text='H', bg='#101329', fg='white', bd=10, width=2, height=2, font=('arial', 10, 'bold'),
               relief=GROOVE)
labelH.grid(row=0, column=5, padx=5)

labelJ = Label(frameAtoL, text='J', bg='#101329', fg='white', bd=10, width=2, height=2, font=('arial', 10, 'bold'),
               relief=GROOVE)
labelJ.grid(row=0, column=6, padx=5)

labelK = Label(frameAtoL, text='K', bg='#101329', fg='white', bd=10, width=2, height=2, font=('arial', 10, 'bold'),
               relief=GROOVE)
labelK.grid(row=0, column=7, padx=5)

labelL = Label(frameAtoL, text='L', bg='#101329', fg='white', bd=10, width=2, height=2, font=('arial', 10, 'bold'),
               relief=GROOVE)
labelL.grid(row=0, padx=5, column=8)

frameZtoM = Frame(keyboardFrame)
frameZtoM.grid(row=3, column=0, pady=5)

labelZ = Label(frameZtoM, text='Z', bg='#101329', fg='white', bd=10, width=2, height=2, font=('arial', 10, 'bold'),
               relief=GROOVE)
labelZ.grid(row=0, padx=5, column=0)

labelX = Label(frameZtoM, text='X', bg='#101329', fg='white', bd=10, width=2, height=2, font=('arial', 10, 'bold'),
               relief=GROOVE)
labelX.grid(row=0, padx=5, column=1)

labelC = Label(frameZtoM, text='C', bg='#101329', fg='white', bd=10, width=2, height=2, font=('arial', 10, 'bold'),
               relief=GROOVE)
labelC.grid(row=0, padx=5, column=2)

labelV = Label(frameZtoM, text='V', bg='#101329', fg='white', bd=10, width=2, height=2, font=('arial', 10, 'bold'),
               relief=GROOVE)
labelV.grid(row=0, padx=5, column=3)

labelB = Label(frameZtoM, text='B', bg='#101329', fg='white', bd=10, width=2, height=2, font=('arial', 10, 'bold'),
               relief=GROOVE)
labelB.grid(row=0, padx=5, column=4)

labelN = Label(frameZtoM, text='N', bg='#101329', fg='white', bd=10, width=2, height=2, font=('arial', 10, 'bold'),
               relief=GROOVE)
labelN.grid(row=0, padx=5, column=5)

labelM = Label(frameZtoM, text='M', bg='#101329', fg='white', bd=10, width=2, height=2, font=('arial', 10, 'bold'),
               relief=GROOVE)
labelM.grid(row=0, padx=5, column=6)

frameSpaceBar = Frame(keyboardFrame)
frameSpaceBar.grid(row=4, column=0, pady=5)

labelSpaceBar = Label(frameSpaceBar, text='Space Bar', bg='#101329', fg='white', bd=10, width=55, height=2,
                      font=('arial', 10, 'bold'), relief=GROOVE)
labelSpaceBar.grid(row=0, padx=5, column=0)


def colorChange(widget):
    widget.config(bg='dark green')
    widget.after(100, lambda: widget.config(bg='#101329'))


# numbers_list = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '0']
number_labels = [label0, label1, label2, label3, label4, label5, label6, label7, label8, label9]
for i in range(10):
    root.bind(i, lambda event, x=number_labels[i]: colorChange(x))

small_alphabet_list = list(string.ascii_lowercase)
capital_alphabet_list = list(string.ascii_uppercase)

label_alphabets = [labelA, labelB, labelC, labelD, labelE, labelF, labelG, labelH, labelI, labelJ, labelK, labelL, labelM, labelN, labelO, labelP, labelQ, labelR, labelS, labelT, labelU, labelV, labelW, labelX, labelY, labelZ]

for i in range(26):
    root.bind(small_alphabet_list[i], lambda event, x=label_alphabets[i]: colorChange(x))
    root.bind(capital_alphabet_list[i], lambda event, x=label_alphabets[i]: colorChange(x))

root.bind('<space>', lambda event, x=labelSpaceBar: colorChange(x))


root.mainloop()
