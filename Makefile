PROGRAM_NAME = pc
SRC=src
DIST_FILES=$(SRC) $(PROGRAM_NAME).ps $(PROGRAM_NAME).dvi $(PROGRAM_NAME).pdf Makefile

CHAPTER_1_DIR = "Chapter1"
CHAPTER_2_DIR = "Chapter2"
CHAPTER_3_DIR = "Chapter3"
CHAPTER_4_DIR = "Chapter4"
CHAPTER_5_DIR = "Chapter5"

TASK_CHAPTER_1_1_CHUNK_ID = "3n+1"
TASK_CHAPTER_1_1_FILENAME = "$(SRC)/$(CHAPTER_1_DIR)/Collatz.java"
TASK_CHAPTER_1_2_CHUNK_ID = "Minesweeper"
TASK_CHAPTER_1_2_FILENAME = "$(SRC)/$(CHAPTER_1_DIR)/Minesweeper.java"
TASK_CHAPTER_1_3_CHUNK_ID = "The Trip"
TASK_CHAPTER_1_3_FILENAME = "$(SRC)/$(CHAPTER_1_DIR)/TheTrip.java"
TASK_CHAPTER_1_4_CHUNK_ID= "LC Display"
TASK_CHAPTER_1_4_FILENAME = "$(SRC)/$(CHAPTER_1_DIR)/LCDisplay.java"
TASK_CHAPTER_1_8_CHUNK_ID= "Australian Voting"
TASK_CHAPTER_1_8_FILENAME = "$(SRC)/$(CHAPTER_1_DIR)/AustralianVoting.java"

TASK_CHAPTER_2_1_CHUNK_ID = "Jolly Jumpers"
TASK_CHAPTER_2_1_FILENAME = "$(SRC)/$(CHAPTER_2_DIR)/JollyJumpers.java"
TASK_CHAPTER_2_4_CHUNK_ID = "Crypt Kicker"
TASK_CHAPTER_2_4_FILENAME = "$(SRC)/$(CHAPTER_2_DIR)/CryptKicker.java"

TASK_CHAPTER_3_4_CHUNK_ID = "Crypt Kicker II"
TASK_CHAPTER_3_4_FILENAME = "$(SRC)/$(CHAPTER_3_DIR)/CryptKickerII.java"
TASK_CHAPTER_3_6_CHUNK_ID = "File Fragmentation"
TASK_CHAPTER_3_6_FILENAME = "$(SRC)/$(CHAPTER_3_DIR)/FileFragmentation.java"

TASK_CHAPTER_4_7_CHUNK_ID = "ShellSort"
TASK_CHAPTER_4_7_FILENAME = "$(SRC)/$(CHAPTER_4_DIR)/ShellSort.java"

TASK_CHAPTER_5_4_CHUNK_ID = "Ones"
TASK_CHAPTER_5_4_FILENAME = "$(SRC)/$(CHAPTER_5_DIR)/Ones.java"

all: dirs $(TASK_CHAPTER_1_1_CHUNK_ID) $(TASK_CHAPTER_1_2_CHUNK_ID) $(TASK_CHAPTER_1_3_CHUNK_ID) $(TASK_CHAPTER_1_4_CHUNK_ID)  $(TASK_CHAPTER_1_8_CHUNK_ID) $(TASK_CHAPTER_2_1_CHUNK_ID) $(TASK_CHAPTER_2_4_CHUNK_ID) $(TASK_CHAPTER_3_4_CHUNK_ID) $(TASK_CHAPTER_3_6_CHUNK_ID) $(TASK_CHAPTER_4_7_CHUNK_ID) $(TASK_CHAPTER_5_4_CHUNK_ID) $(PROGRAM_NAME) dist 

$(TASK_CHAPTER_1_1_CHUNK_ID): $(PROGRAM_NAME).nw
	notangle -R$(TASK_CHAPTER_1_1_CHUNK_ID) $(PROGRAM_NAME).nw > $(TASK_CHAPTER_1_1_FILENAME)

$(TASK_CHAPTER_1_2_CHUNK_ID): $(PROGRAM_NAME).nw
	notangle -R$(TASK_CHAPTER_1_2_CHUNK_ID) $(PROGRAM_NAME).nw > $(TASK_CHAPTER_1_2_FILENAME)

$(TASK_CHAPTER_1_3_CHUNK_ID): $(PROGRAM_NAME).nw
	notangle -R$(TASK_CHAPTER_1_3_CHUNK_ID) $(PROGRAM_NAME).nw > $(TASK_CHAPTER_1_3_FILENAME)

$(TASK_CHAPTER_1_4_CHUNK_ID): $(PROGRAM_NAME).nw
	notangle -R$(TASK_CHAPTER_1_4_CHUNK_ID) $(PROGRAM_NAME).nw > $(TASK_CHAPTER_1_4_FILENAME)

$(TASK_CHAPTER_1_8_CHUNK_ID): $(PROGRAM_NAME).nw
	notangle -R$(TASK_CHAPTER_1_8_CHUNK_ID) $(PROGRAM_NAME).nw > $(TASK_CHAPTER_1_8_FILENAME)

$(TASK_CHAPTER_2_1_CHUNK_ID): $(PROGRAM_NAME).nw
	notangle -R$(TASK_CHAPTER_2_1_CHUNK_ID) $(PROGRAM_NAME).nw > $(TASK_CHAPTER_2_1_FILENAME)

$(TASK_CHAPTER_2_4_CHUNK_ID): $(PROGRAM_NAME).nw
	notangle -R$(TASK_CHAPTER_2_4_CHUNK_ID) $(PROGRAM_NAME).nw > $(TASK_CHAPTER_2_4_FILENAME)

$(TASK_CHAPTER_3_4_CHUNK_ID): $(PROGRAM_NAME).nw
	notangle -R$(TASK_CHAPTER_3_4_CHUNK_ID) $(PROGRAM_NAME).nw > $(TASK_CHAPTER_3_4_FILENAME)

$(TASK_CHAPTER_3_6_CHUNK_ID): $(PROGRAM_NAME).nw
	notangle -R$(TASK_CHAPTER_3_6_CHUNK_ID) $(PROGRAM_NAME).nw > $(TASK_CHAPTER_3_6_FILENAME)

$(TASK_CHAPTER_4_7_CHUNK_ID): $(PROGRAM_NAME).nw
	notangle -R$(TASK_CHAPTER_4_7_CHUNK_ID) $(PROGRAM_NAME).nw > $(TASK_CHAPTER_4_7_FILENAME)

$(TASK_CHAPTER_5_4_CHUNK_ID): $(PROGRAM_NAME).nw
	notangle -R$(TASK_CHAPTER_5_4_CHUNK_ID) $(PROGRAM_NAME).nw > $(TASK_CHAPTER_5_4_FILENAME)

$(PROGRAM_NAME).tex: 
	noweave -latex -index -delay $(PROGRAM_NAME).nw > $(PROGRAM_NAME).tex

$(PROGRAM_NAME).dvi: $(PROGRAM_NAME).tex
	latex -quiet $(PROGRAM_NAME).tex && latex -quiet $(PROGRAM_NAME).tex

$(PROGRAM_NAME).ps: $(PROGRAM_NAME).dvi
	dvips -q* $(PROGRAM_NAME).dvi

$(PROGRAM_NAME).pdf: $(PROGRAM_NAME).ps
	ps2pdf $(PROGRAM_NAME).ps

dirs:
	mkdir -p $(SRC)/$(CHAPTER_1_DIR) $(SRC)/$(CHAPTER_2_DIR) $(SRC)/$(CHAPTER_3_DIR) $(SRC)/$(CHAPTER_4_DIR) $(SRC)/$(CHAPTER_5_DIR)

dist:
	tar -cf $(PROGRAM_NAME).tar $(DIST_FILES) && gzip $(PROGRAM_NAME).tar

clean:
	-rm -f $(PROGRAM_NAME).toc $(PROGRAM_NAME).log $(PROGRAM_NAME).tex $(PROGRAM_NAME).aux $(PROGRAM_NAME).dvi $(PROGRAM_NAME).ps $(PROGRAM_NAME).pdf $(TASK_CHAPTER_1_1_FILENAME) $(TASK_CHAPTER_1_2_FILENAME) $(TASK_CHAPTER_1_3_FILENAME) $(TASK_CHAPTER_1_4_FILENAME) $(TASK_CHAPTER_1_8_FILENAME) $(TASK_CHAPTER_2_1_FILENAME) $(TASK_CHAPTER_2_4_FILENAME) $(TASK_CHAPTER_3_4_FILENAME) $(TASK_CHAPTER_3_6_FILENAME) $(TASK_CHAPTER_4_7_FILENAME) $(TASK_CHAPTER_5_4_FILENAME) $(PROGRAM_NAME).tar.gz

$(PROGRAM_NAME): $(DIST_FILES)

