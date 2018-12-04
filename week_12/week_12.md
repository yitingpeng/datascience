

```python
import nltk
from nltk.tokenize import sent_tokenize, word_tokenize
from nltk.tokenize import TreebankWordTokenizer
from nltk.tag import pos_tag
from nltk import ne_chunk, Tree
nltk.download('punkt')
nltk.download('averaged_perceptron_tagger')
nltk.download('maxent_ne_chunker')
nltk.download('words')
```

    [nltk_data] Downloading package punkt to
    [nltk_data]     C:\Users\Julin\AppData\Roaming\nltk_data...
    [nltk_data]   Package punkt is already up-to-date!
    [nltk_data] Downloading package averaged_perceptron_tagger to
    [nltk_data]     C:\Users\Julin\AppData\Roaming\nltk_data...
    [nltk_data]   Package averaged_perceptron_tagger is already up-to-
    [nltk_data]       date!
    [nltk_data] Downloading package maxent_ne_chunker to
    [nltk_data]     C:\Users\Julin\AppData\Roaming\nltk_data...
    [nltk_data]   Package maxent_ne_chunker is already up-to-date!
    [nltk_data] Downloading package words to
    [nltk_data]     C:\Users\Julin\AppData\Roaming\nltk_data...
    [nltk_data]   Package words is already up-to-date!
    




    True




```python
f = open('C:\\Users\\Julin\\Documents\\GitHub\\datascience\\week_12\\news.txt','r',encoding='utf-8')
ex = f.readlines()
f.close()
len(ex)
```




    38




```python
strEx = " ".join(str(x) for x in ex)
```


```python
def preprocess(sent):
    sent = nltk.word_tokenize(sent)
    sent = nltk.pos_tag(sent)
    return sent
```


```python
sent = preprocess(strEx)
sent
```




    [('\ufeffHong', 'RB'),
     ('Kong', 'NNP'),
     ('(', '('),
     ('CNN', 'NNP'),
     (')', ')'),
     ('The', 'DT'),
     ('major', 'JJ'),
     ('defeat', 'NN'),
     ('for', 'IN'),
     ('Taiwan', 'NNP'),
     ("'s", 'POS'),
     ('ruling', 'NN'),
     ('Democratic', 'JJ'),
     ('Progressive', 'NNP'),
     ('Party', 'NNP'),
     ('(', '('),
     ('DPP', 'NNP'),
     (')', ')'),
     ('in', 'IN'),
     ('Saturday', 'NNP'),
     ("'s", 'POS'),
     ('local', 'JJ'),
     ('elections', 'NNS'),
     ('has', 'VBZ'),
     ('profound', 'VBN'),
     ('consequences', 'NNS'),
     ('for', 'IN'),
     ('regional', 'JJ'),
     ('stability', 'NN'),
     ('and', 'CC'),
     ('great', 'JJ'),
     ('power', 'NN'),
     ('politics', 'NNS'),
     ('.', '.'),
     ('It', 'PRP'),
     ('makes', 'VBZ'),
     ('victory', 'NN'),
     ('by', 'IN'),
     ('the', 'DT'),
     ('Kuomintang', 'NNP'),
     ('(', '('),
     ('KMT', 'NNP'),
     (')', ')'),
     (',', ','),
     ('the', 'DT'),
     ('former', 'JJ'),
     ('ruling', 'NN'),
     ('party', 'NN'),
     ('that', 'WDT'),
     ('preaches', 'VBZ'),
     ('friendly', 'JJ'),
     ('relations', 'NNS'),
     ('with', 'IN'),
     ('Beijing', 'NNP'),
     (',', ','),
     ('highly', 'RB'),
     ('likely', 'JJ'),
     ('in', 'IN'),
     ('the', 'DT'),
     ('2020', 'CD'),
     ('presidential', 'JJ'),
     ('election', 'NN'),
     ('.', '.'),
     ('This', 'DT'),
     ('prospect', 'NN'),
     ('will', 'MD'),
     ('have', 'VB'),
     ('major', 'JJ'),
     ('implications', 'NNS'),
     ('for', 'IN'),
     ('both', 'DT'),
     ('cross-strait', 'JJ'),
     ('and', 'CC'),
     ('Sino-US', 'JJ'),
     ('relations', 'NNS'),
     ('.', '.'),
     ('Before', 'IN'),
     ('Saturday', 'NNP'),
     ("'s", 'POS'),
     ('election', 'NN'),
     (',', ','),
     ('the', 'DT'),
     ('DPP', 'NNP'),
     ('controlled', 'VBD'),
     ('13', 'CD'),
     ('out', 'IN'),
     ('Taiwan', 'NNP'),
     ("'s", 'POS'),
     ('22', 'CD'),
     ('cities', 'NNS'),
     ('and', 'CC'),
     ('counties', 'NNS'),
     ('.', '.'),
     ('Now', 'RB'),
     (',', ','),
     ('it', 'PRP'),
     ('is', 'VBZ'),
     ('left', 'VBN'),
     ('with', 'IN'),
     ('only', 'RB'),
     ('six', 'CD'),
     ('.', '.'),
     ('More', 'RBR'),
     ('importantly', 'RB'),
     (',', ','),
     ('the', 'DT'),
     ('DPP', 'NNP'),
     ('lost', 'VBN'),
     ('in', 'IN'),
     ('both', 'DT'),
     ('Kaohsiung', 'NNP'),
     ('and', 'CC'),
     ('Taichung', 'NNP'),
     (',', ','),
     ('the', 'DT'),
     ('second', 'JJ'),
     ('and', 'CC'),
     ('third', 'JJ'),
     ('largest', 'JJS'),
     ('cities', 'NNS'),
     ('of', 'IN'),
     ('Taiwan', 'NNP'),
     ('.', '.'),
     ('Zhang', 'NNP'),
     ('Baohui', 'NNP'),
     ('Zhang', 'NNP'),
     ('Baohui', 'NNP'),
     ('The', 'DT'),
     ('defeat', 'NN'),
     ('in', 'IN'),
     ('Kaohsiung', 'NNP'),
     ('is', 'VBZ'),
     ('particularly', 'RB'),
     ('traumatizing', 'VBG'),
     ('for', 'IN'),
     ('many', 'JJ'),
     ('DPP', 'NNP'),
     ('supporters', 'NNS'),
     (',', ','),
     ('as', 'IN'),
     ('it', 'PRP'),
     ('has', 'VBZ'),
     ('been', 'VBN'),
     ('a', 'DT'),
     ('DPP', 'NNP'),
     ('stronghold', 'NN'),
     ('for', 'IN'),
     ('over', 'IN'),
     ('two', 'CD'),
     ('decades', 'NNS'),
     ('.', '.'),
     ('Indeed', 'RB'),
     (',', ','),
     ('the', 'DT'),
     ('main', 'JJ'),
     ('support', 'NN'),
     ('base', 'NN'),
     ('for', 'IN'),
     ('the', 'DT'),
     ('DPP', 'NNP'),
     ('traditionally', 'RB'),
     ('lies', 'VBZ'),
     ('in', 'IN'),
     ('southern', 'JJ'),
     ('Taiwan', 'NNP'),
     ('.', '.'),
     ('Due', 'NNP'),
     ('to', 'TO'),
     ('magnitude', 'VB'),
     ('of', 'IN'),
     ('the', 'DT'),
     ('defeat', 'NN'),
     (',', ','),
     ('President', 'NNP'),
     ('Tsai', 'NNP'),
     ('Ing-wen', 'NNP'),
     ('resigned', 'VBD'),
     ('as', 'IN'),
     ('chairwoman', 'NN'),
     ('of', 'IN'),
     ('the', 'DT'),
     ('DPP', 'NNP'),
     ('.', '.'),
     ('The', 'DT'),
     ('DPP', 'NNP'),
     ('defeat', 'NN'),
     ('reveals', 'NNS'),
     ('widespread', 'JJ'),
     ('dissatisfaction', 'NN'),
     ('with', 'IN'),
     ('the', 'DT'),
     ('ruling', 'VBG'),
     ('party', 'NN'),
     (',', ','),
     ('and', 'CC'),
     ('a', 'DT'),
     ('major', 'JJ'),
     ('cause', 'NN'),
     ('of', 'IN'),
     ('that', 'DT'),
     ('discontent', 'NN'),
     ('is', 'VBZ'),
     ('renewed', 'VBN'),
     ('instability', 'NN'),
     ('in', 'IN'),
     ('the', 'DT'),
     ('Taiwan', 'NNP'),
     ('Strait', 'NNP'),
     ('.', '.'),
     ('Since', 'IN'),
     ('Taiwan', 'NNP'),
     ('became', 'VBD'),
     ('a', 'DT'),
     ('democracy', 'NN'),
     ('in', 'IN'),
     ('the', 'DT'),
     ('early', 'JJ'),
     ('1990s', 'CD'),
     (',', ','),
     ('cross-strait', 'JJ'),
     ('relations', 'NNS'),
     ('have', 'VBP'),
     ('become', 'VBN'),
     ('increasingly', 'RB'),
     ('conflictual', 'JJ'),
     ('due', 'JJ'),
     ('to', 'TO'),
     ('Taiwan', 'NNP'),
     ("'s", 'POS'),
     ('increasing', 'VBG'),
     ('assertion', 'NN'),
     ('of', 'IN'),
     ('its', 'PRP$'),
     ('own', 'JJ'),
     ('identity', 'NN'),
     (',', ','),
     ('which', 'WDT'),
     ('is', 'VBZ'),
     ('at', 'IN'),
     ('odds', 'NNS'),
     ('with', 'IN'),
     ('China', 'NNP'),
     ("'s", 'POS'),
     ('long-standing', 'JJ'),
     ('principle', 'NN'),
     ('that', 'IN'),
     ('there', 'EX'),
     ('is', 'VBZ'),
     ('only', 'RB'),
     ('one', 'CD'),
     ('China', 'NNP'),
     ('and', 'CC'),
     ('Taiwan', 'NNP'),
     ('is', 'VBZ'),
     ('part', 'NN'),
     ('of', 'IN'),
     ('China', 'NNP'),
     ('.', '.'),
     ('In', 'IN'),
     ('1992', 'CD'),
     (',', ','),
     ('officials', 'NNS'),
     ('from', 'IN'),
     ('the', 'DT'),
     ('two', 'CD'),
     ('sides', 'NNS'),
     ('met', 'VBD'),
     ('in', 'IN'),
     ('Singapore', 'NNP'),
     ('and', 'CC'),
     ('agreed', 'VBD'),
     ('to', 'TO'),
     ('use', 'VB'),
     ('a', 'DT'),
     ('vaguely', 'RB'),
     ('defined', 'VBN'),
     ('``', '``'),
     ('One', 'CD'),
     ('China', 'NNP'),
     ("''", "''"),
     ('principle', 'NN'),
     ('to', 'TO'),
     ('form', 'VB'),
     ('the', 'DT'),
     ('basis', 'NN'),
     ('of', 'IN'),
     ('their', 'PRP$'),
     ('bilateral', 'JJ'),
     ('relations', 'NNS'),
     ('.', '.'),
     ('This', 'DT'),
     ('was', 'VBD'),
     ('the', 'DT'),
     ('so-called', 'JJ'),
     ('``', '``'),
     ('1992', 'CD'),
     ('Consensus', 'NNP'),
     ("''", "''"),
     ('.', '.'),
     ('As', 'RB'),
     ('long', 'RB'),
     ('as', 'IN'),
     ('Taipei', 'NNP'),
     ('pays', 'VBZ'),
     ('formal', 'JJ'),
     ('respect', 'NN'),
     ('to', 'TO'),
     ('the', 'DT'),
     ('principle', 'NN'),
     (',', ','),
     ('Beijing', 'NNP'),
     ('can', 'MD'),
     ('allow', 'VB'),
     ('peaceful', 'JJ'),
     ('relations', 'NNS'),
     ('across', 'IN'),
     ('the', 'DT'),
     ('Taiwan', 'NNP'),
     ('Strait', 'NNP'),
     ('.', '.'),
     ('However', 'RB'),
     (',', ','),
     ('in', 'IN'),
     ('2000', 'CD'),
     ('DPP', 'NNP'),
     ('candidate', 'NN'),
     ('Chen', 'NNP'),
     ('Shui-bian', 'JJ'),
     ('became', 'VBD'),
     ('president', 'NN'),
     ('of', 'IN'),
     ('Taiwan', 'NNP'),
     ('and', 'CC'),
     ('he', 'PRP'),
     ('began', 'VBD'),
     ('to', 'TO'),
     ('push', 'VB'),
     ('for', 'IN'),
     ('revisionist', 'JJ'),
     ('policies', 'NNS'),
     ('that', 'WDT'),
     ('sought', 'VBD'),
     ('to', 'TO'),
     ('move', 'VB'),
     ('the', 'DT'),
     ('island', 'NN'),
     ('toward', 'IN'),
     ('greater', 'JJR'),
     ('de', 'FW'),
     ('jure', 'NN'),
     ('independence', 'NN'),
     ('.', '.'),
     ('Taiwan', 'NNP'),
     ('President', 'NNP'),
     ('resigns', 'VBZ'),
     ('as', 'IN'),
     ('head', 'NN'),
     ('of', 'IN'),
     ('party', 'NN'),
     ('after', 'IN'),
     ('losses', 'NNS'),
     ('in', 'IN'),
     ('local', 'JJ'),
     ('elections', 'NNS'),
     ('Taiwan', 'NNP'),
     ('President', 'NNP'),
     ('resigns', 'VBZ'),
     ('as', 'IN'),
     ('head', 'NN'),
     ('of', 'IN'),
     ('party', 'NN'),
     ('after', 'IN'),
     ('losses', 'NNS'),
     ('in', 'IN'),
     ('local', 'JJ'),
     ('elections', 'NNS'),
     ('The', 'DT'),
     ('ensuing', 'VBG'),
     ('instability', 'NN'),
     ('across', 'IN'),
     ('the', 'DT'),
     ('Taiwan', 'NNP'),
     ('Strait', 'NNP'),
     ('led', 'VBD'),
     ('to', 'TO'),
     ('KMT', 'NNP'),
     ("'s", 'POS'),
     ('return', 'NN'),
     ('to', 'TO'),
     ('power', 'NN'),
     ('in', 'IN'),
     ('2008', 'CD'),
     ('.', '.'),
     ('President', 'NNP'),
     ('Ma', 'NNP'),
     ('Ying-jeou', 'NNP'),
     ('not', 'RB'),
     ('only', 'RB'),
     ('re-affirmed', 'VB'),
     ('the', 'DT'),
     ('``', '``'),
     ('1992', 'CD'),
     ('Consensus', 'NNP'),
     ("''", "''"),
     ('but', 'CC'),
     ('also', 'RB'),
     ('expanded', 'VBD'),
     ('bilateral', 'JJ'),
     ('dialogues', 'NNS'),
     ('and', 'CC'),
     ('interactions', 'NNS'),
     ('at', 'IN'),
     ('political', 'JJ'),
     (',', ','),
     ('economic', 'JJ'),
     (',', ','),
     ('and', 'CC'),
     ('societal', 'JJ'),
     ('levels', 'NNS'),
     ('.', '.'),
     ('In', 'IN'),
     ('October', 'NNP'),
     ('2015', 'CD'),
     (',', ','),
     ('he', 'PRP'),
     ('and', 'CC'),
     ('Chinese', 'JJ'),
     ('President', 'NNP'),
     ('Xi', 'NNP'),
     ('Jinping', 'NNP'),
     ('had', 'VBD'),
     ('a', 'DT'),
     ('historic', 'JJ'),
     ('meeting', 'NN'),
     ('in', 'IN'),
     ('Singapore', 'NNP'),
     ('.', '.'),
     ('Ma', 'NNP'),
     ("'s", 'POS'),
     ('mainland', 'NN'),
     ('policy', 'NN'),
     ('was', 'VBD'),
     ('supported', 'VBN'),
     ('by', 'IN'),
     ('a', 'DT'),
     ('clear', 'JJ'),
     ('majority', 'NN'),
     ('of', 'IN'),
     ('people', 'NNS'),
     ('in', 'IN'),
     ('Taiwan', 'NNP'),
     (',', ','),
     ('who', 'WP'),
     ('cherished', 'VBD'),
     ('the', 'DT'),
     ('peace', 'NN'),
     ('and', 'CC'),
     ('prosperity', 'NN'),
     ('enabled', 'VBN'),
     ('by', 'IN'),
     ('cooperative', 'JJ'),
     ('relations', 'NNS'),
     ('between', 'IN'),
     ('the', 'DT'),
     ('two', 'CD'),
     ('sides', 'NNS'),
     ('.', '.'),
     ('However', 'RB'),
     (',', ','),
     ('Ma', 'NNP'),
     ("'s", 'POS'),
     ('perceived', 'JJ'),
     ('ineptness', 'NN'),
     ('on', 'IN'),
     ('the', 'DT'),
     ('domestic', 'JJ'),
     ('front', 'NN'),
     ('weakened', 'VBD'),
     ('popular', 'JJ'),
     ('support', 'NN'),
     ('for', 'IN'),
     ('the', 'DT'),
     ('KMT', 'NNP'),
     ('.', '.'),
     ('So', 'RB'),
     ('in', 'IN'),
     ('2016', 'CD'),
     ('the', 'DT'),
     ('DPP', 'NNP'),
     ("'s", 'POS'),
     ('Tsai', 'NNP'),
     ('Ing-wen', 'NNP'),
     ('became', 'VBD'),
     ('president', 'NN'),
     ('after', 'IN'),
     ('a', 'DT'),
     ('clear', 'JJ'),
     ('electoral', 'JJ'),
     ('victory', 'NN'),
     ('.', '.'),
     ('Tsai', 'NNP'),
     ("'s", 'POS'),
     ('victory', 'NN'),
     ('was', 'VBD'),
     ('partly', 'RB'),
     ('due', 'JJ'),
     ('to', 'TO'),
     ('her', 'PRP$'),
     ('promise', 'NN'),
     ('during', 'IN'),
     ('the', 'DT'),
     ('election', 'NN'),
     ('that', 'IN'),
     ('she', 'PRP'),
     ('would', 'MD'),
     ('not', 'RB'),
     ('seek', 'VB'),
     ('to', 'TO'),
     ('change', 'VB'),
     ('the', 'DT'),
     ('status', 'NN'),
     ('quo', 'NN'),
     ('of', 'IN'),
     ('cross-strait', 'JJ'),
     ('relations', 'NNS'),
     ('.', '.'),
     ('After', 'IN'),
     ('the', 'DT'),
     ('election', 'NN'),
     (',', ','),
     ('however', 'RB'),
     (',', ','),
     ('Tsai', 'NNP'),
     (',', ','),
     ('constrained', 'VBN'),
     ('by', 'IN'),
     ('the', 'DT'),
     ('DPP', 'NNP'),
     ('ideology', 'NN'),
     ('that', 'IN'),
     ('Taiwan', 'NNP'),
     ('is', 'VBZ'),
     ('not', 'RB'),
     ('part', 'NN'),
     ('of', 'IN'),
     ('China', 'NNP'),
     (',', ','),
     ('refused', 'VBD'),
     ('to', 'TO'),
     ('accept', 'VB'),
     ('the', 'DT'),
     ('``', '``'),
     ('1992', 'CD'),
     ('Consensus', 'NNP'),
     ("''", "''"),
     ('and', 'CC'),
     ('the', 'DT'),
     ('underlying', 'VBG'),
     ('``', '``'),
     ('One', 'CD'),
     ('China', 'NNP'),
     ("''", "''"),
     ('principle', 'NN'),
     ('.', '.'),
     ('This', 'DT'),
     ('defiance', 'NN'),
     ('by', 'IN'),
     ('the', 'DT'),
     ('DPP', 'NNP'),
     ('has', 'VBZ'),
     ('once', 'RB'),
     ('again', 'RB'),
     ('disrupted', 'JJ'),
     ('bilateral', 'JJ'),
     ('relations', 'NNS'),
     ('with', 'IN'),
     ('Beijing', 'NNP'),
     (',', ','),
     ('which', 'WDT'),
     ('has', 'VBZ'),
     ('used', 'VBN'),
     ('a', 'DT'),
     ('variety', 'NN'),
     ('of', 'IN'),
     ('measures', 'NNS'),
     ('to', 'TO'),
     ('undermine', 'VB'),
     ('her', 'PRP'),
     ('and', 'CC'),
     ('the', 'DT'),
     ('DPP', 'NNP'),
     ('.', '.'),
     ('Play', 'NNP'),
     ('Video', 'NNP'),
     ('China', 'NNP'),
     ("'firmly", 'NNP'),
     ("'", 'POS'),
     ('opposes', 'NNS'),
     ('Taiwan', 'NNP'),
     ('Travel', 'NNP'),
     ('Act', 'NNP'),
     ('02:14', 'CD'),
     ('For', 'IN'),
     ('example', 'NN'),
     (',', ','),
     ('Beijing', 'NNP'),
     ('has', 'VBZ'),
     ('vastly', 'RB'),
     ('reduced', 'VBN'),
     ('the', 'DT'),
     ('number', 'NN'),
     ('of', 'IN'),
     ('Chinese', 'JJ'),
     ('tourists', 'NNS'),
     ('to', 'TO'),
     ('visit', 'VB'),
     ('Taiwan', 'NNP'),
     ('and', 'CC'),
     ('this', 'DT'),
     ('measure', 'NN'),
     ('has', 'VBZ'),
     ('seriously', 'RB'),
     ('harmed', 'VBN'),
     ('Taiwan', 'NNP'),
     ("'s", 'POS'),
     ('travel', 'NN'),
     ('industry', 'NN'),
     ('.', '.'),
     ('Moreover', 'RB'),
     (',', ','),
     ('China', 'NNP'),
     ('has', 'VBZ'),
     ('stepped', 'VBN'),
     ('up', 'RP'),
     ('military', 'JJ'),
     ('pressure', 'NN'),
     ('on', 'IN'),
     ('Taiwan', 'NNP'),
     ('by', 'IN'),
     ('regularly', 'RB'),
     ('flying', 'VBG'),
     ('its', 'PRP$'),
     ('jet', 'NN'),
     ('fighters', 'NNS'),
     ('and', 'CC'),
     ('bombers', 'NNS'),
     ('around', 'IN'),
     ('the', 'DT'),
     ('island', 'NN'),
     ('.', '.'),
     ('The', 'DT'),
     ('coercive', 'JJ'),
     ('measures', 'NNS'),
     ('have', 'VBP'),
     ('made', 'VBN'),
     ('Taiwan', 'NNP'),
     ("'s", 'POS'),
     ('people', 'NNS'),
     ('uneasy', 'VBP'),
     ('about', 'IN'),
     ('the', 'DT'),
     ('island', 'NN'),
     ("'s", 'POS'),
     ('security', 'NN'),
     ('.', '.'),
     ('The', 'DT'),
     ('resurfacing', 'NN'),
     ('of', 'IN'),
     ('tension', 'NN'),
     ('and', 'CC'),
     ('conflicts', 'NNS'),
     ('with', 'IN'),
     ('Beijing', 'NNP'),
     ('has', 'VBZ'),
     ('undermined', 'VBN'),
     ('the', 'DT'),
     ('legitimacy', 'NN'),
     ('of', 'IN'),
     ('Tsai', 'NNP'),
     ("'s", 'POS'),
     ('rule', 'NN'),
     ('.', '.'),
     ('While', 'IN'),
     ('the', 'DT'),
     ('people', 'NNS'),
     ('of', 'IN'),
     ('Taiwan', 'NNP'),
     ('highly', 'RB'),
     ('value', 'NN'),
     ('the', 'DT'),
     ('island', 'NN'),
     ("'s", 'POS'),
     ('distinctly', 'RB'),
     ('separate', 'JJ'),
     ('identity', 'NN'),
     ('from', 'IN'),
     ('China', 'NNP'),
     (',', ','),
     ('they', 'PRP'),
     ('nonetheless', 'RB'),
     ('crave', 'VBP'),
     ('stability', 'NN'),
     ('and', 'CC'),
     ('peace', 'NN'),
     ('in', 'IN'),
     ('the', 'DT'),
     ('Taiwan', 'NNP'),
     ('Strait', 'NNP'),
     ('.', '.'),
     ('Before', 'IN'),
     ('the', 'DT'),
     ('election', 'NN'),
     (',', ','),
     ('public', 'JJ'),
     ('opinion', 'NN'),
     ('polls', 'NNS'),
     ('regularly', 'RB'),
     ('showed', 'VBD'),
     ('that', 'IN'),
     ('Tsai', 'NNP'),
     ("'s", 'POS'),
     ('approval', 'NN'),
     ('rating', 'NN'),
     ('hovered', 'VBD'),
     ('below', 'IN'),
     ('30', 'CD'),
     ('%', 'NN'),
     ('.', '.'),
     ('The', 'DT'),
     ('DPP', 'NNP'),
     ("'s", 'POS'),
     ('resounding', 'VBG'),
     ('defeat', 'NN'),
     ('on', 'IN'),
     ('Saturday', 'NNP'),
     ('should', 'MD'),
     ('at', 'IN'),
     ('least', 'JJS'),
     ('serve', 'NN'),
     ('to', 'TO'),
     ('restrain', 'VB'),
     ('its', 'PRP$'),
     ('revisionist', 'NN'),
     ('inclination', 'NN'),
     (',', ','),
     ('especially', 'RB'),
     ('its', 'PRP$'),
     ('ideologues', 'NNS'),
     ("'", 'POS'),
     ('quest', 'NN'),
     ('for', 'IN'),
     ('Taiwan', 'NNP'),
     ("'s", 'POS'),
     ('de', 'JJ'),
     ('jure', 'NN'),
     ('independence', 'NN'),
     ('.', '.'),
     ('Public', 'JJ'),
     ('opinion', 'NN'),
     ('is', 'VBZ'),
     ('clear', 'JJ'),
     ('on', 'IN'),
     ('the', 'DT'),
     ('matter', 'NN'),
     ('.', '.'),
     ('It', 'PRP'),
     ('is', 'VBZ'),
     ('therefore', 'RB'),
     ('highly', 'RB'),
     ('likely', 'JJ'),
     ('that', 'IN'),
     ('the', 'DT'),
     ('DPP', 'NNP'),
     ("'s", 'POS'),
     ('campaign', 'NN'),
     ('for', 'IN'),
     ('the', 'DT'),
     ('2020', 'CD'),
     ('presidential', 'JJ'),
     ('election', 'NN'),
     ('will', 'MD'),
     ('attempt', 'VB'),
     ('to', 'TO'),
     ('project', 'VB'),
     ('a', 'DT'),
     ('moderate', 'JJ'),
     ('position', 'NN'),
     ('on', 'IN'),
     ('the', 'DT'),
     ('cross-strait', 'JJ'),
     ('issue', 'NN'),
     ('.', '.'),
     ('However', 'RB'),
     (',', ','),
     ('the', 'DT'),
     ('question', 'NN'),
     ('is', 'VBZ'),
     ('whether', 'IN'),
     ('Taiwan', 'NNP'),
     ("'s", 'POS'),
     ('mainstream', 'NN'),
     ('voters', 'NNS'),
     ('could', 'MD'),
     ('again', 'RB'),
     ('trust', 'VB'),
     ('the', 'DT'),
     ('DPP', 'NNP'),
     ('on', 'IN'),
     ('this', 'DT'),
     ('crucial', 'JJ'),
     ('issue', 'NN'),
     ('.', '.'),
     ('A', 'DT'),
     ('win', 'NN'),
     ('for', 'IN'),
     ('Beijing', 'NNP'),
     ('The', 'DT'),
     ('scale', 'NN'),
     ('of', 'IN'),
     ('the', 'DT'),
     ('DPP', 'NNP'),
     ("'s", 'POS'),
     ('losses', 'NNS'),
     ('has', 'VBZ'),
     ('convinced', 'VBN'),
     ('many', 'JJ'),
     ('Taiwan', 'NNP'),
     ('commentators', 'NNS'),
     ('that', 'IN'),
     ('it', 'PRP'),
     ('will', 'MD'),
     ('be', 'VB'),
     ('very', 'RB'),
     ('difficult', 'JJ'),
     ('for', 'IN'),
     ('the', 'DT'),
     ('DPP', 'NNP'),
     ('to', 'TO'),
     ('win', 'VB'),
     ('the', 'DT'),
     ('2020', 'CD'),
     ('presidential', 'JJ'),
     ('election', 'NN'),
     (',', ','),
     ('either', 'RB'),
     ('with', 'IN'),
     ('Tsai', 'NNP'),
     ('or', 'CC'),
     ('another', 'DT'),
     ('candidate', 'NN'),
     ('.', '.'),
     ('If', 'IN'),
     ('the', 'DT'),
     ('KMT', 'NNP'),
     ('once', 'RB'),
     ('again', 'RB'),
     ('returns', 'NNS'),
     ('to', 'TO'),
     ('power', 'NN'),
     (',', ','),
     ('Beijing', 'NNP'),
     ('will', 'MD'),
     ('reap', 'VB'),
     ('a', 'DT'),
     ('big', 'JJ'),
     ('win', 'NN'),
     ('with', 'IN'),
     ('clear', 'JJ'),
     ('implications', 'NNS'),
     ('for', 'IN'),
     ('regional', 'JJ'),
     ('stability', 'NN'),
     ('.', '.'),
     ('The', 'DT'),
     ('Taiwan', 'NNP'),
     ('Strait', 'NNP'),
     ('remains', 'VBZ'),
     ('one', 'CD'),
     ('of', 'IN'),
     ('the', 'DT'),
     ('most', 'RBS'),
     ('dangerous', 'JJ'),
     ('hotspots', 'NNS'),
     ('in', 'IN'),
     ('East', 'NNP'),
     ('Asia', 'NNP'),
     ('.', '.'),
     ('Re-stabilized', 'JJ'),
     ('cross-strait', 'JJ'),
     ('relations', 'NNS'),
     ('will', 'MD'),
     ('no', 'DT'),
     ('doubt', 'NN'),
     ('tone', 'VB'),
     ('down', 'RP'),
     ('the', 'DT'),
     ('likelihood', 'NN'),
     ('of', 'IN'),
     ('military', 'JJ'),
     ('conflicts', 'NNS'),
     (',', ','),
     ('thereby', 'RB'),
     ('removing', 'VBG'),
     ('a', 'DT'),
     ('major', 'JJ'),
     ('security', 'NN'),
     ('challenge', 'NN'),
     ('for', 'IN'),
     ('China', 'NNP'),
     ('.', '.'),
     ('The', 'DT'),
     ('prospect', 'NN'),
     ('of', 'IN'),
     ('a', 'DT'),
     ('possible', 'JJ'),
     ('KMT', 'NNP'),
     ('victory', 'NN'),
     ('in', 'IN'),
     ('the', 'DT'),
     ('2020', 'CD'),
     ('presidential', 'JJ'),
     ('election', 'NN'),
     ('may', 'MD'),
     ('also', 'RB'),
     ('motivate', 'VB'),
     ('Beijing', 'NNP'),
     ('to', 'TO'),
     ('rekindle', 'VB'),
     ('its', 'PRP$'),
     ('vision', 'NN'),
     ('for', 'IN'),
     ('a', 'DT'),
     ('``', '``'),
     ('peaceful', 'JJ'),
     ('reunification', 'NN'),
     ("''", "''"),
     ('with', 'IN'),
     ('Taiwan', 'NNP'),
     ('.', '.'),
     ('For', 'IN'),
     ('example', 'NN'),
     (',', ','),
     ('during', 'IN'),
     ('Ma', 'NNP'),
     ('Ying-jeou', 'NNP'),
     ("'s", 'POS'),
     ('reign', 'NN'),
     (',', ','),
     ('Beijing', 'NNP'),
     ('tried', 'VBD'),
     ('to', 'TO'),
     ('complete', 'VB'),
     ('a', 'DT'),
     ('``', '``'),
     ('peace', 'NN'),
     ('treaty', 'NN'),
     ("''", "''"),
     ('between', 'IN'),
     ('the', 'DT'),
     ('two', 'CD'),
     ('sides', 'NNS'),
     ('as', 'IN'),
     ('a', 'DT'),
     ('first', 'JJ'),
     ('step', 'NN'),
     ('toward', 'IN'),
     ('long-term', 'JJ'),
     ('political', 'JJ'),
     ('union', 'NN'),
     ('.', '.'),
     ('A', 'DT'),
     ('setback', 'NN'),
     ('for', 'IN'),
     ('Washington', 'NNP'),
     ('The', 'DT'),
     ('DPP', 'NNP'),
     ("'s", 'POS'),
     ('defeat', 'NN'),
     ('and', 'CC'),
     ('a', 'DT'),
     ('possible', 'JJ'),
     ('bigger', 'JJR'),
     ('defeat', 'NN'),
     ('in', 'IN'),
     ('the', 'DT'),
     ('2020', 'CD'),
     ('presidential', 'JJ'),
     ('election', 'NN'),
     ('also', 'RB'),
     ('imply', 'VBP'),
     ('strategic', 'JJ'),
     ('setbacks', 'NNS'),
     ('for', 'IN'),
     ('the', 'DT'),
     ('Trump', 'NNP'),
     ('administration', 'NN'),
     (',', ','),
     ('which', 'WDT'),
     ('is', 'VBZ'),
     ('pursuing', 'VBG'),
     ...]




```python
##自訂名詞片語 
pattern = 'NP:{<DT>?<JJ>*<NN>}'
cp = nltk.RegexpParser(pattern)
cs = cp.parse(sent)
print(cs)
```

    (S
      ﻿Hong/RB
      Kong/NNP
      (/(
      CNN/NNP
      )/)
      (NP The/DT major/JJ defeat/NN)
      for/IN
      Taiwan/NNP
      's/POS
      (NP ruling/NN)
      Democratic/JJ
      Progressive/NNP
      Party/NNP
      (/(
      DPP/NNP
      )/)
      in/IN
      Saturday/NNP
      's/POS
      local/JJ
      elections/NNS
      has/VBZ
      profound/VBN
      consequences/NNS
      for/IN
      (NP regional/JJ stability/NN)
      and/CC
      (NP great/JJ power/NN)
      politics/NNS
      ./.
      It/PRP
      makes/VBZ
      (NP victory/NN)
      by/IN
      the/DT
      Kuomintang/NNP
      (/(
      KMT/NNP
      )/)
      ,/,
      (NP the/DT former/JJ ruling/NN)
      (NP party/NN)
      that/WDT
      preaches/VBZ
      friendly/JJ
      relations/NNS
      with/IN
      Beijing/NNP
      ,/,
      highly/RB
      likely/JJ
      in/IN
      the/DT
      2020/CD
      (NP presidential/JJ election/NN)
      ./.
      (NP This/DT prospect/NN)
      will/MD
      have/VB
      major/JJ
      implications/NNS
      for/IN
      both/DT
      cross-strait/JJ
      and/CC
      Sino-US/JJ
      relations/NNS
      ./.
      Before/IN
      Saturday/NNP
      's/POS
      (NP election/NN)
      ,/,
      the/DT
      DPP/NNP
      controlled/VBD
      13/CD
      out/IN
      Taiwan/NNP
      's/POS
      22/CD
      cities/NNS
      and/CC
      counties/NNS
      ./.
      Now/RB
      ,/,
      it/PRP
      is/VBZ
      left/VBN
      with/IN
      only/RB
      six/CD
      ./.
      More/RBR
      importantly/RB
      ,/,
      the/DT
      DPP/NNP
      lost/VBN
      in/IN
      both/DT
      Kaohsiung/NNP
      and/CC
      Taichung/NNP
      ,/,
      the/DT
      second/JJ
      and/CC
      third/JJ
      largest/JJS
      cities/NNS
      of/IN
      Taiwan/NNP
      ./.
      Zhang/NNP
      Baohui/NNP
      Zhang/NNP
      Baohui/NNP
      (NP The/DT defeat/NN)
      in/IN
      Kaohsiung/NNP
      is/VBZ
      particularly/RB
      traumatizing/VBG
      for/IN
      many/JJ
      DPP/NNP
      supporters/NNS
      ,/,
      as/IN
      it/PRP
      has/VBZ
      been/VBN
      a/DT
      DPP/NNP
      (NP stronghold/NN)
      for/IN
      over/IN
      two/CD
      decades/NNS
      ./.
      Indeed/RB
      ,/,
      (NP the/DT main/JJ support/NN)
      (NP base/NN)
      for/IN
      the/DT
      DPP/NNP
      traditionally/RB
      lies/VBZ
      in/IN
      southern/JJ
      Taiwan/NNP
      ./.
      Due/NNP
      to/TO
      magnitude/VB
      of/IN
      (NP the/DT defeat/NN)
      ,/,
      President/NNP
      Tsai/NNP
      Ing-wen/NNP
      resigned/VBD
      as/IN
      (NP chairwoman/NN)
      of/IN
      the/DT
      DPP/NNP
      ./.
      The/DT
      DPP/NNP
      (NP defeat/NN)
      reveals/NNS
      (NP widespread/JJ dissatisfaction/NN)
      with/IN
      the/DT
      ruling/VBG
      (NP party/NN)
      ,/,
      and/CC
      (NP a/DT major/JJ cause/NN)
      of/IN
      (NP that/DT discontent/NN)
      is/VBZ
      renewed/VBN
      (NP instability/NN)
      in/IN
      the/DT
      Taiwan/NNP
      Strait/NNP
      ./.
      Since/IN
      Taiwan/NNP
      became/VBD
      (NP a/DT democracy/NN)
      in/IN
      the/DT
      early/JJ
      1990s/CD
      ,/,
      cross-strait/JJ
      relations/NNS
      have/VBP
      become/VBN
      increasingly/RB
      conflictual/JJ
      due/JJ
      to/TO
      Taiwan/NNP
      's/POS
      increasing/VBG
      (NP assertion/NN)
      of/IN
      its/PRP$
      (NP own/JJ identity/NN)
      ,/,
      which/WDT
      is/VBZ
      at/IN
      odds/NNS
      with/IN
      China/NNP
      's/POS
      (NP long-standing/JJ principle/NN)
      that/IN
      there/EX
      is/VBZ
      only/RB
      one/CD
      China/NNP
      and/CC
      Taiwan/NNP
      is/VBZ
      (NP part/NN)
      of/IN
      China/NNP
      ./.
      In/IN
      1992/CD
      ,/,
      officials/NNS
      from/IN
      the/DT
      two/CD
      sides/NNS
      met/VBD
      in/IN
      Singapore/NNP
      and/CC
      agreed/VBD
      to/TO
      use/VB
      a/DT
      vaguely/RB
      defined/VBN
      ``/``
      One/CD
      China/NNP
      ''/''
      (NP principle/NN)
      to/TO
      form/VB
      (NP the/DT basis/NN)
      of/IN
      their/PRP$
      bilateral/JJ
      relations/NNS
      ./.
      This/DT
      was/VBD
      the/DT
      so-called/JJ
      ``/``
      1992/CD
      Consensus/NNP
      ''/''
      ./.
      As/RB
      long/RB
      as/IN
      Taipei/NNP
      pays/VBZ
      (NP formal/JJ respect/NN)
      to/TO
      (NP the/DT principle/NN)
      ,/,
      Beijing/NNP
      can/MD
      allow/VB
      peaceful/JJ
      relations/NNS
      across/IN
      the/DT
      Taiwan/NNP
      Strait/NNP
      ./.
      However/RB
      ,/,
      in/IN
      2000/CD
      DPP/NNP
      (NP candidate/NN)
      Chen/NNP
      Shui-bian/JJ
      became/VBD
      (NP president/NN)
      of/IN
      Taiwan/NNP
      and/CC
      he/PRP
      began/VBD
      to/TO
      push/VB
      for/IN
      revisionist/JJ
      policies/NNS
      that/WDT
      sought/VBD
      to/TO
      move/VB
      (NP the/DT island/NN)
      toward/IN
      greater/JJR
      de/FW
      (NP jure/NN)
      (NP independence/NN)
      ./.
      Taiwan/NNP
      President/NNP
      resigns/VBZ
      as/IN
      (NP head/NN)
      of/IN
      (NP party/NN)
      after/IN
      losses/NNS
      in/IN
      local/JJ
      elections/NNS
      Taiwan/NNP
      President/NNP
      resigns/VBZ
      as/IN
      (NP head/NN)
      of/IN
      (NP party/NN)
      after/IN
      losses/NNS
      in/IN
      local/JJ
      elections/NNS
      The/DT
      ensuing/VBG
      (NP instability/NN)
      across/IN
      the/DT
      Taiwan/NNP
      Strait/NNP
      led/VBD
      to/TO
      KMT/NNP
      's/POS
      (NP return/NN)
      to/TO
      (NP power/NN)
      in/IN
      2008/CD
      ./.
      President/NNP
      Ma/NNP
      Ying-jeou/NNP
      not/RB
      only/RB
      re-affirmed/VB
      the/DT
      ``/``
      1992/CD
      Consensus/NNP
      ''/''
      but/CC
      also/RB
      expanded/VBD
      bilateral/JJ
      dialogues/NNS
      and/CC
      interactions/NNS
      at/IN
      political/JJ
      ,/,
      economic/JJ
      ,/,
      and/CC
      societal/JJ
      levels/NNS
      ./.
      In/IN
      October/NNP
      2015/CD
      ,/,
      he/PRP
      and/CC
      Chinese/JJ
      President/NNP
      Xi/NNP
      Jinping/NNP
      had/VBD
      (NP a/DT historic/JJ meeting/NN)
      in/IN
      Singapore/NNP
      ./.
      Ma/NNP
      's/POS
      (NP mainland/NN)
      (NP policy/NN)
      was/VBD
      supported/VBN
      by/IN
      (NP a/DT clear/JJ majority/NN)
      of/IN
      people/NNS
      in/IN
      Taiwan/NNP
      ,/,
      who/WP
      cherished/VBD
      (NP the/DT peace/NN)
      and/CC
      (NP prosperity/NN)
      enabled/VBN
      by/IN
      cooperative/JJ
      relations/NNS
      between/IN
      the/DT
      two/CD
      sides/NNS
      ./.
      However/RB
      ,/,
      Ma/NNP
      's/POS
      (NP perceived/JJ ineptness/NN)
      on/IN
      (NP the/DT domestic/JJ front/NN)
      weakened/VBD
      (NP popular/JJ support/NN)
      for/IN
      the/DT
      KMT/NNP
      ./.
      So/RB
      in/IN
      2016/CD
      the/DT
      DPP/NNP
      's/POS
      Tsai/NNP
      Ing-wen/NNP
      became/VBD
      (NP president/NN)
      after/IN
      (NP a/DT clear/JJ electoral/JJ victory/NN)
      ./.
      Tsai/NNP
      's/POS
      (NP victory/NN)
      was/VBD
      partly/RB
      due/JJ
      to/TO
      her/PRP$
      (NP promise/NN)
      during/IN
      (NP the/DT election/NN)
      that/IN
      she/PRP
      would/MD
      not/RB
      seek/VB
      to/TO
      change/VB
      (NP the/DT status/NN)
      (NP quo/NN)
      of/IN
      cross-strait/JJ
      relations/NNS
      ./.
      After/IN
      (NP the/DT election/NN)
      ,/,
      however/RB
      ,/,
      Tsai/NNP
      ,/,
      constrained/VBN
      by/IN
      the/DT
      DPP/NNP
      (NP ideology/NN)
      that/IN
      Taiwan/NNP
      is/VBZ
      not/RB
      (NP part/NN)
      of/IN
      China/NNP
      ,/,
      refused/VBD
      to/TO
      accept/VB
      the/DT
      ``/``
      1992/CD
      Consensus/NNP
      ''/''
      and/CC
      the/DT
      underlying/VBG
      ``/``
      One/CD
      China/NNP
      ''/''
      (NP principle/NN)
      ./.
      (NP This/DT defiance/NN)
      by/IN
      the/DT
      DPP/NNP
      has/VBZ
      once/RB
      again/RB
      disrupted/JJ
      bilateral/JJ
      relations/NNS
      with/IN
      Beijing/NNP
      ,/,
      which/WDT
      has/VBZ
      used/VBN
      (NP a/DT variety/NN)
      of/IN
      measures/NNS
      to/TO
      undermine/VB
      her/PRP
      and/CC
      the/DT
      DPP/NNP
      ./.
      Play/NNP
      Video/NNP
      China/NNP
      'firmly/NNP
      '/POS
      opposes/NNS
      Taiwan/NNP
      Travel/NNP
      Act/NNP
      02:14/CD
      For/IN
      (NP example/NN)
      ,/,
      Beijing/NNP
      has/VBZ
      vastly/RB
      reduced/VBN
      (NP the/DT number/NN)
      of/IN
      Chinese/JJ
      tourists/NNS
      to/TO
      visit/VB
      Taiwan/NNP
      and/CC
      (NP this/DT measure/NN)
      has/VBZ
      seriously/RB
      harmed/VBN
      Taiwan/NNP
      's/POS
      (NP travel/NN)
      (NP industry/NN)
      ./.
      Moreover/RB
      ,/,
      China/NNP
      has/VBZ
      stepped/VBN
      up/RP
      (NP military/JJ pressure/NN)
      on/IN
      Taiwan/NNP
      by/IN
      regularly/RB
      flying/VBG
      its/PRP$
      (NP jet/NN)
      fighters/NNS
      and/CC
      bombers/NNS
      around/IN
      (NP the/DT island/NN)
      ./.
      The/DT
      coercive/JJ
      measures/NNS
      have/VBP
      made/VBN
      Taiwan/NNP
      's/POS
      people/NNS
      uneasy/VBP
      about/IN
      (NP the/DT island/NN)
      's/POS
      (NP security/NN)
      ./.
      (NP The/DT resurfacing/NN)
      of/IN
      (NP tension/NN)
      and/CC
      conflicts/NNS
      with/IN
      Beijing/NNP
      has/VBZ
      undermined/VBN
      (NP the/DT legitimacy/NN)
      of/IN
      Tsai/NNP
      's/POS
      (NP rule/NN)
      ./.
      While/IN
      the/DT
      people/NNS
      of/IN
      Taiwan/NNP
      highly/RB
      (NP value/NN)
      (NP the/DT island/NN)
      's/POS
      distinctly/RB
      (NP separate/JJ identity/NN)
      from/IN
      China/NNP
      ,/,
      they/PRP
      nonetheless/RB
      crave/VBP
      (NP stability/NN)
      and/CC
      (NP peace/NN)
      in/IN
      the/DT
      Taiwan/NNP
      Strait/NNP
      ./.
      Before/IN
      (NP the/DT election/NN)
      ,/,
      (NP public/JJ opinion/NN)
      polls/NNS
      regularly/RB
      showed/VBD
      that/IN
      Tsai/NNP
      's/POS
      (NP approval/NN)
      (NP rating/NN)
      hovered/VBD
      below/IN
      30/CD
      (NP %/NN)
      ./.
      The/DT
      DPP/NNP
      's/POS
      resounding/VBG
      (NP defeat/NN)
      on/IN
      Saturday/NNP
      should/MD
      at/IN
      least/JJS
      (NP serve/NN)
      to/TO
      restrain/VB
      its/PRP$
      (NP revisionist/NN)
      (NP inclination/NN)
      ,/,
      especially/RB
      its/PRP$
      ideologues/NNS
      '/POS
      (NP quest/NN)
      for/IN
      Taiwan/NNP
      's/POS
      (NP de/JJ jure/NN)
      (NP independence/NN)
      ./.
      (NP Public/JJ opinion/NN)
      is/VBZ
      clear/JJ
      on/IN
      (NP the/DT matter/NN)
      ./.
      It/PRP
      is/VBZ
      therefore/RB
      highly/RB
      likely/JJ
      that/IN
      the/DT
      DPP/NNP
      's/POS
      (NP campaign/NN)
      for/IN
      the/DT
      2020/CD
      (NP presidential/JJ election/NN)
      will/MD
      attempt/VB
      to/TO
      project/VB
      (NP a/DT moderate/JJ position/NN)
      on/IN
      (NP the/DT cross-strait/JJ issue/NN)
      ./.
      However/RB
      ,/,
      (NP the/DT question/NN)
      is/VBZ
      whether/IN
      Taiwan/NNP
      's/POS
      (NP mainstream/NN)
      voters/NNS
      could/MD
      again/RB
      trust/VB
      the/DT
      DPP/NNP
      on/IN
      (NP this/DT crucial/JJ issue/NN)
      ./.
      (NP A/DT win/NN)
      for/IN
      Beijing/NNP
      (NP The/DT scale/NN)
      of/IN
      the/DT
      DPP/NNP
      's/POS
      losses/NNS
      has/VBZ
      convinced/VBN
      many/JJ
      Taiwan/NNP
      commentators/NNS
      that/IN
      it/PRP
      will/MD
      be/VB
      very/RB
      difficult/JJ
      for/IN
      the/DT
      DPP/NNP
      to/TO
      win/VB
      the/DT
      2020/CD
      (NP presidential/JJ election/NN)
      ,/,
      either/RB
      with/IN
      Tsai/NNP
      or/CC
      (NP another/DT candidate/NN)
      ./.
      If/IN
      the/DT
      KMT/NNP
      once/RB
      again/RB
      returns/NNS
      to/TO
      (NP power/NN)
      ,/,
      Beijing/NNP
      will/MD
      reap/VB
      (NP a/DT big/JJ win/NN)
      with/IN
      clear/JJ
      implications/NNS
      for/IN
      (NP regional/JJ stability/NN)
      ./.
      The/DT
      Taiwan/NNP
      Strait/NNP
      remains/VBZ
      one/CD
      of/IN
      the/DT
      most/RBS
      dangerous/JJ
      hotspots/NNS
      in/IN
      East/NNP
      Asia/NNP
      ./.
      Re-stabilized/JJ
      cross-strait/JJ
      relations/NNS
      will/MD
      (NP no/DT doubt/NN)
      tone/VB
      down/RP
      (NP the/DT likelihood/NN)
      of/IN
      military/JJ
      conflicts/NNS
      ,/,
      thereby/RB
      removing/VBG
      (NP a/DT major/JJ security/NN)
      (NP challenge/NN)
      for/IN
      China/NNP
      ./.
      (NP The/DT prospect/NN)
      of/IN
      a/DT
      possible/JJ
      KMT/NNP
      (NP victory/NN)
      in/IN
      the/DT
      2020/CD
      (NP presidential/JJ election/NN)
      may/MD
      also/RB
      motivate/VB
      Beijing/NNP
      to/TO
      rekindle/VB
      its/PRP$
      (NP vision/NN)
      for/IN
      a/DT
      ``/``
      (NP peaceful/JJ reunification/NN)
      ''/''
      with/IN
      Taiwan/NNP
      ./.
      For/IN
      (NP example/NN)
      ,/,
      during/IN
      Ma/NNP
      Ying-jeou/NNP
      's/POS
      (NP reign/NN)
      ,/,
      Beijing/NNP
      tried/VBD
      to/TO
      complete/VB
      a/DT
      ``/``
      (NP peace/NN)
      (NP treaty/NN)
      ''/''
      between/IN
      the/DT
      two/CD
      sides/NNS
      as/IN
      (NP a/DT first/JJ step/NN)
      toward/IN
      (NP long-term/JJ political/JJ union/NN)
      ./.
      (NP A/DT setback/NN)
      for/IN
      Washington/NNP
      The/DT
      DPP/NNP
      's/POS
      (NP defeat/NN)
      and/CC
      a/DT
      possible/JJ
      bigger/JJR
      (NP defeat/NN)
      in/IN
      the/DT
      2020/CD
      (NP presidential/JJ election/NN)
      also/RB
      imply/VBP
      strategic/JJ
      setbacks/NNS
      for/IN
      the/DT
      Trump/NNP
      (NP administration/NN)
      ,/,
      which/WDT
      is/VBZ
      pursuing/VBG
      a/DT
      new/JJ
      China/NNP
      (NP policy/NN)
      ./.
      While/IN
      successive/JJ
      US/NNP
      governments/NNS
      since/IN
      the/DT
      1970s/CD
      have/VBP
      adopted/VBN
      a/DT
      ``/``
      One/CD
      China/NNP
      ''/''
      (NP policy/NN)
      ,/,
      the/DT
      Trump/NNP
      (NP administration/NN)
      has/VBZ
      been/VBN
      tightening/VBG
      its/PRP$
      diplomatic/JJ
      and/CC
      (NP security/NN)
      relations/NNS
      with/IN
      Taiwan/NNP
      ./.
      While/IN
      denying/VBG
      (NP any/DT intention/NN)
      to/TO
      contain/VB
      China/NNP
      ,/,
      Washington/NNP
      's/POS
      new/JJ
      China/NNP
      (NP policy/NN)
      nonetheless/RB
      seeks/VBZ
      to/TO
      maximize/VB
      leverages/NNS
      to/TO
      limit/VB
      China/NNP
      's/POS
      (NP power/NN)
      and/CC
      influences/NNS
      ./.
      Taiwan/NNP
      voters/NNS
      reject/VBP
      (NP same-sex/JJ marriage/NN)
      Taiwan/NNP
      voters/NNS
      reject/VBP
      (NP same-sex/JJ marriage/NN)
      Taiwan/NNP
      naturally/RB
      fits/VBZ
      well/RB
      within/IN
      that/DT
      ./.
      In/IN
      particular/JJ
      ,/,
      the/DT
      DPP/NNP
      's/POS
      (NP antagonistic/JJ stand/NN)
      against/IN
      China/NNP
      creates/VBZ
      (NP the/DT perfect/JJ synergy/NN)
      with/IN
      Washington/NNP
      's/POS
      China/NNP
      (NP policy/NN)
      ./.
      (NP The/DT prospect/NN)
      of/IN
      KMT/NNP
      winning/VBG
      the/DT
      2020/CD
      (NP election/NN)
      will/MD
      (NP no/DT doubt/NN)
      undermine/VBP
      Washington/NNP
      's/POS
      China/NNP
      (NP policy/NN)
      ./.
      While/IN
      various/JJ
      KMT/NNP
      governments/NNS
      in/IN
      (NP the/DT past/NN)
      had/VBD
      very/RB
      good/JJ
      relations/NNS
      with/IN
      the/DT
      US/NNP
      ,/,
      (NP the/DT party/NN)
      's/POS
      (NP traditional/JJ approach/NN)
      to/TO
      cross-strait/JJ
      relations/NNS
      will/MD
      make/VB
      it/PRP
      less/RBR
      motivated/JJ
      to/TO
      work/VB
      with/IN
      the/DT
      US/NNP
      to/TO
      contain/VB
      a/DT
      rising/VBG
      China/NNP
      ./.
      The/DT
      DPP/NNP
      's/POS
      (NP electoral/JJ defeat/NN)
      (NP therefore/NN)
      carries/VBZ
      far/RB
      larger/JJR
      consequences/NNS
      that/WDT
      transcend/VBP
      (NP the/DT island/NN)
      itself/PRP
      ,/,
      including/VBG
      major/JJ
      implications/NNS
      for/IN
      both/DT
      China/NNP
      and/CC
      the/DT
      United/NNP
      States/NNPS
      ./.
      Their/PRP$
      respective/JJ
      strategic/JJ
      interests/NNS
      are/VBP
      deeply/RB
      embedded/VBN
      with/IN
      Taiwan/NNP
      's/POS
      domestic/JJ
      political/JJ
      situations/NNS
      ./.
      In/IN
      (NP that/DT sense/NN)
      ,/,
      Taiwan/NNP
      is/VBZ
      (NP a/DT key/JJ battleground/NN)
      for/IN
      the/DT
      rising/VBG
      (NP rivalry/NN)
      between/IN
      the/DT
      two/CD
      great/JJ
      powers/NNS
      ./.)
    


```python
tree1 = nltk.Tree('NP',['Alick'])
print(tree1)
tree2 = nltk.Tree('N',['Alick','Rabbit'])
print(tree2)
tree3 = nltk.Tree('S',[tree1,tree2])
print(tree3.label())
```

    (NP Alick)
    (N Alick Rabbit)
    S
    


```python
NER = ne_chunk(nltk.pos_tag(word_tokenize(strEx)), binary=False)
type(NER)
print(NER)
```

    (S
      ﻿Hong/RB
      (GPE Kong/NNP)
      (/(
      (ORGANIZATION CNN/NNP)
      )/)
      The/DT
      major/JJ
      defeat/NN
      for/IN
      (GPE Taiwan/NNP)
      's/POS
      ruling/NN
      (ORGANIZATION Democratic/JJ Progressive/NNP Party/NNP)
      (/(
      (ORGANIZATION DPP/NNP)
      )/)
      in/IN
      Saturday/NNP
      's/POS
      local/JJ
      elections/NNS
      has/VBZ
      profound/VBN
      consequences/NNS
      for/IN
      regional/JJ
      stability/NN
      and/CC
      great/JJ
      power/NN
      politics/NNS
      ./.
      It/PRP
      makes/VBZ
      victory/NN
      by/IN
      the/DT
      (ORGANIZATION Kuomintang/NNP)
      (/(
      (ORGANIZATION KMT/NNP)
      )/)
      ,/,
      the/DT
      former/JJ
      ruling/NN
      party/NN
      that/WDT
      preaches/VBZ
      friendly/JJ
      relations/NNS
      with/IN
      (GPE Beijing/NNP)
      ,/,
      highly/RB
      likely/JJ
      in/IN
      the/DT
      2020/CD
      presidential/JJ
      election/NN
      ./.
      This/DT
      prospect/NN
      will/MD
      have/VB
      major/JJ
      implications/NNS
      for/IN
      both/DT
      cross-strait/JJ
      and/CC
      Sino-US/JJ
      relations/NNS
      ./.
      Before/IN
      Saturday/NNP
      's/POS
      election/NN
      ,/,
      the/DT
      (ORGANIZATION DPP/NNP)
      controlled/VBD
      13/CD
      out/IN
      (GPE Taiwan/NNP)
      's/POS
      22/CD
      cities/NNS
      and/CC
      counties/NNS
      ./.
      Now/RB
      ,/,
      it/PRP
      is/VBZ
      left/VBN
      with/IN
      only/RB
      six/CD
      ./.
      More/RBR
      importantly/RB
      ,/,
      the/DT
      (ORGANIZATION DPP/NNP)
      lost/VBN
      in/IN
      both/DT
      (ORGANIZATION Kaohsiung/NNP)
      and/CC
      (GPE Taichung/NNP)
      ,/,
      the/DT
      second/JJ
      and/CC
      third/JJ
      largest/JJS
      cities/NNS
      of/IN
      (GPE Taiwan/NNP)
      ./.
      (PERSON Zhang/NNP Baohui/NNP Zhang/NNP)
      Baohui/NNP
      The/DT
      defeat/NN
      in/IN
      (GPE Kaohsiung/NNP)
      is/VBZ
      particularly/RB
      traumatizing/VBG
      for/IN
      many/JJ
      (ORGANIZATION DPP/NNP)
      supporters/NNS
      ,/,
      as/IN
      it/PRP
      has/VBZ
      been/VBN
      a/DT
      (ORGANIZATION DPP/NNP)
      stronghold/NN
      for/IN
      over/IN
      two/CD
      decades/NNS
      ./.
      Indeed/RB
      ,/,
      the/DT
      main/JJ
      support/NN
      base/NN
      for/IN
      the/DT
      (ORGANIZATION DPP/NNP)
      traditionally/RB
      lies/VBZ
      in/IN
      southern/JJ
      (GPE Taiwan/NNP)
      ./.
      (PERSON Due/NNP)
      to/TO
      magnitude/VB
      of/IN
      the/DT
      defeat/NN
      ,/,
      President/NNP
      (PERSON Tsai/NNP Ing-wen/NNP)
      resigned/VBD
      as/IN
      chairwoman/NN
      of/IN
      the/DT
      (ORGANIZATION DPP/NNP)
      ./.
      The/DT
      (ORGANIZATION DPP/NNP)
      defeat/NN
      reveals/NNS
      widespread/JJ
      dissatisfaction/NN
      with/IN
      the/DT
      ruling/VBG
      party/NN
      ,/,
      and/CC
      a/DT
      major/JJ
      cause/NN
      of/IN
      that/DT
      discontent/NN
      is/VBZ
      renewed/VBN
      instability/NN
      in/IN
      the/DT
      (GPE Taiwan/NNP Strait/NNP)
      ./.
      Since/IN
      (GPE Taiwan/NNP)
      became/VBD
      a/DT
      democracy/NN
      in/IN
      the/DT
      early/JJ
      1990s/CD
      ,/,
      cross-strait/JJ
      relations/NNS
      have/VBP
      become/VBN
      increasingly/RB
      conflictual/JJ
      due/JJ
      to/TO
      (GPE Taiwan/NNP)
      's/POS
      increasing/VBG
      assertion/NN
      of/IN
      its/PRP$
      own/JJ
      identity/NN
      ,/,
      which/WDT
      is/VBZ
      at/IN
      odds/NNS
      with/IN
      (GPE China/NNP)
      's/POS
      long-standing/JJ
      principle/NN
      that/IN
      there/EX
      is/VBZ
      only/RB
      one/CD
      (GPE China/NNP)
      and/CC
      (GPE Taiwan/NNP)
      is/VBZ
      part/NN
      of/IN
      (GPE China/NNP)
      ./.
      In/IN
      1992/CD
      ,/,
      officials/NNS
      from/IN
      the/DT
      two/CD
      sides/NNS
      met/VBD
      in/IN
      (GPE Singapore/NNP)
      and/CC
      agreed/VBD
      to/TO
      use/VB
      a/DT
      vaguely/RB
      defined/VBN
      ``/``
      One/CD
      (GPE China/NNP)
      ''/''
      principle/NN
      to/TO
      form/VB
      the/DT
      basis/NN
      of/IN
      their/PRP$
      bilateral/JJ
      relations/NNS
      ./.
      This/DT
      was/VBD
      the/DT
      so-called/JJ
      ``/``
      1992/CD
      Consensus/NNP
      ''/''
      ./.
      As/RB
      long/RB
      as/IN
      (GPE Taipei/NNP)
      pays/VBZ
      formal/JJ
      respect/NN
      to/TO
      the/DT
      principle/NN
      ,/,
      (GPE Beijing/NNP)
      can/MD
      allow/VB
      peaceful/JJ
      relations/NNS
      across/IN
      the/DT
      (GPE Taiwan/NNP Strait/NNP)
      ./.
      However/RB
      ,/,
      in/IN
      2000/CD
      (ORGANIZATION DPP/NNP)
      candidate/NN
      (PERSON Chen/NNP)
      Shui-bian/JJ
      became/VBD
      president/NN
      of/IN
      (GPE Taiwan/NNP)
      and/CC
      he/PRP
      began/VBD
      to/TO
      push/VB
      for/IN
      revisionist/JJ
      policies/NNS
      that/WDT
      sought/VBD
      to/TO
      move/VB
      the/DT
      island/NN
      toward/IN
      greater/JJR
      de/FW
      jure/NN
      independence/NN
      ./.
      (GPE Taiwan/NNP)
      President/NNP
      resigns/VBZ
      as/IN
      head/NN
      of/IN
      party/NN
      after/IN
      losses/NNS
      in/IN
      local/JJ
      elections/NNS
      (GPE Taiwan/NNP)
      President/NNP
      resigns/VBZ
      as/IN
      head/NN
      of/IN
      party/NN
      after/IN
      losses/NNS
      in/IN
      local/JJ
      elections/NNS
      The/DT
      ensuing/VBG
      instability/NN
      across/IN
      the/DT
      (GPE Taiwan/NNP)
      (PERSON Strait/NNP)
      led/VBD
      to/TO
      (ORGANIZATION KMT/NNP)
      's/POS
      return/NN
      to/TO
      power/NN
      in/IN
      2008/CD
      ./.
      President/NNP
      (PERSON Ma/NNP)
      Ying-jeou/NNP
      not/RB
      only/RB
      re-affirmed/VB
      the/DT
      ``/``
      1992/CD
      Consensus/NNP
      ''/''
      but/CC
      also/RB
      expanded/VBD
      bilateral/JJ
      dialogues/NNS
      and/CC
      interactions/NNS
      at/IN
      political/JJ
      ,/,
      economic/JJ
      ,/,
      and/CC
      societal/JJ
      levels/NNS
      ./.
      In/IN
      October/NNP
      2015/CD
      ,/,
      he/PRP
      and/CC
      (GPE Chinese/JJ)
      President/NNP
      (PERSON Xi/NNP Jinping/NNP)
      had/VBD
      a/DT
      historic/JJ
      meeting/NN
      in/IN
      (GPE Singapore/NNP)
      ./.
      (PERSON Ma/NNP)
      's/POS
      mainland/NN
      policy/NN
      was/VBD
      supported/VBN
      by/IN
      a/DT
      clear/JJ
      majority/NN
      of/IN
      people/NNS
      in/IN
      (GPE Taiwan/NNP)
      ,/,
      who/WP
      cherished/VBD
      the/DT
      peace/NN
      and/CC
      prosperity/NN
      enabled/VBN
      by/IN
      cooperative/JJ
      relations/NNS
      between/IN
      the/DT
      two/CD
      sides/NNS
      ./.
      However/RB
      ,/,
      (PERSON Ma/NNP)
      's/POS
      perceived/JJ
      ineptness/NN
      on/IN
      the/DT
      domestic/JJ
      front/NN
      weakened/VBD
      popular/JJ
      support/NN
      for/IN
      the/DT
      (ORGANIZATION KMT/NNP)
      ./.
      So/RB
      in/IN
      2016/CD
      the/DT
      (ORGANIZATION DPP/NNP)
      's/POS
      (PERSON Tsai/NNP Ing-wen/NNP)
      became/VBD
      president/NN
      after/IN
      a/DT
      clear/JJ
      electoral/JJ
      victory/NN
      ./.
      (PERSON Tsai/NNP)
      's/POS
      victory/NN
      was/VBD
      partly/RB
      due/JJ
      to/TO
      her/PRP$
      promise/NN
      during/IN
      the/DT
      election/NN
      that/IN
      she/PRP
      would/MD
      not/RB
      seek/VB
      to/TO
      change/VB
      the/DT
      status/NN
      quo/NN
      of/IN
      cross-strait/JJ
      relations/NNS
      ./.
      After/IN
      the/DT
      election/NN
      ,/,
      however/RB
      ,/,
      (PERSON Tsai/NNP)
      ,/,
      constrained/VBN
      by/IN
      the/DT
      (ORGANIZATION DPP/NNP)
      ideology/NN
      that/IN
      (GPE Taiwan/NNP)
      is/VBZ
      not/RB
      part/NN
      of/IN
      (GPE China/NNP)
      ,/,
      refused/VBD
      to/TO
      accept/VB
      the/DT
      ``/``
      1992/CD
      Consensus/NNP
      ''/''
      and/CC
      the/DT
      underlying/VBG
      ``/``
      One/CD
      (GPE China/NNP)
      ''/''
      principle/NN
      ./.
      This/DT
      defiance/NN
      by/IN
      the/DT
      (ORGANIZATION DPP/NNP)
      has/VBZ
      once/RB
      again/RB
      disrupted/JJ
      bilateral/JJ
      relations/NNS
      with/IN
      (GPE Beijing/NNP)
      ,/,
      which/WDT
      has/VBZ
      used/VBN
      a/DT
      variety/NN
      of/IN
      measures/NNS
      to/TO
      undermine/VB
      her/PRP
      and/CC
      the/DT
      (ORGANIZATION DPP/NNP)
      ./.
      (PERSON Play/NNP Video/NNP China/NNP)
      'firmly/NNP
      '/POS
      opposes/NNS
      (GPE Taiwan/NNP)
      Travel/NNP
      Act/NNP
      02:14/CD
      For/IN
      example/NN
      ,/,
      (GPE Beijing/NNP)
      has/VBZ
      vastly/RB
      reduced/VBN
      the/DT
      number/NN
      of/IN
      (GPE Chinese/JJ)
      tourists/NNS
      to/TO
      visit/VB
      (GPE Taiwan/NNP)
      and/CC
      this/DT
      measure/NN
      has/VBZ
      seriously/RB
      harmed/VBN
      (GPE Taiwan/NNP)
      's/POS
      travel/NN
      industry/NN
      ./.
      Moreover/RB
      ,/,
      (GPE China/NNP)
      has/VBZ
      stepped/VBN
      up/RP
      military/JJ
      pressure/NN
      on/IN
      (GPE Taiwan/NNP)
      by/IN
      regularly/RB
      flying/VBG
      its/PRP$
      jet/NN
      fighters/NNS
      and/CC
      bombers/NNS
      around/IN
      the/DT
      island/NN
      ./.
      The/DT
      coercive/JJ
      measures/NNS
      have/VBP
      made/VBN
      (GPE Taiwan/NNP)
      's/POS
      people/NNS
      uneasy/VBP
      about/IN
      the/DT
      island/NN
      's/POS
      security/NN
      ./.
      The/DT
      resurfacing/NN
      of/IN
      tension/NN
      and/CC
      conflicts/NNS
      with/IN
      (GPE Beijing/NNP)
      has/VBZ
      undermined/VBN
      the/DT
      legitimacy/NN
      of/IN
      (GPE Tsai/NNP)
      's/POS
      rule/NN
      ./.
      While/IN
      the/DT
      people/NNS
      of/IN
      (GPE Taiwan/NNP)
      highly/RB
      value/NN
      the/DT
      island/NN
      's/POS
      distinctly/RB
      separate/JJ
      identity/NN
      from/IN
      (GPE China/NNP)
      ,/,
      they/PRP
      nonetheless/RB
      crave/VBP
      stability/NN
      and/CC
      peace/NN
      in/IN
      the/DT
      (GPE Taiwan/NNP Strait/NNP)
      ./.
      Before/IN
      the/DT
      election/NN
      ,/,
      public/JJ
      opinion/NN
      polls/NNS
      regularly/RB
      showed/VBD
      that/IN
      (PERSON Tsai/NNP)
      's/POS
      approval/NN
      rating/NN
      hovered/VBD
      below/IN
      30/CD
      %/NN
      ./.
      The/DT
      (ORGANIZATION DPP/NNP)
      's/POS
      resounding/VBG
      defeat/NN
      on/IN
      Saturday/NNP
      should/MD
      at/IN
      least/JJS
      serve/NN
      to/TO
      restrain/VB
      its/PRP$
      revisionist/NN
      inclination/NN
      ,/,
      especially/RB
      its/PRP$
      ideologues/NNS
      '/POS
      quest/NN
      for/IN
      (GPE Taiwan/NNP)
      's/POS
      de/JJ
      jure/NN
      independence/NN
      ./.
      Public/JJ
      opinion/NN
      is/VBZ
      clear/JJ
      on/IN
      the/DT
      matter/NN
      ./.
      It/PRP
      is/VBZ
      therefore/RB
      highly/RB
      likely/JJ
      that/IN
      the/DT
      (ORGANIZATION DPP/NNP)
      's/POS
      campaign/NN
      for/IN
      the/DT
      2020/CD
      presidential/JJ
      election/NN
      will/MD
      attempt/VB
      to/TO
      project/VB
      a/DT
      moderate/JJ
      position/NN
      on/IN
      the/DT
      cross-strait/JJ
      issue/NN
      ./.
      However/RB
      ,/,
      the/DT
      question/NN
      is/VBZ
      whether/IN
      (GPE Taiwan/NNP)
      's/POS
      mainstream/NN
      voters/NNS
      could/MD
      again/RB
      trust/VB
      the/DT
      (ORGANIZATION DPP/NNP)
      on/IN
      this/DT
      crucial/JJ
      issue/NN
      ./.
      A/DT
      win/NN
      for/IN
      Beijing/NNP
      The/DT
      scale/NN
      of/IN
      the/DT
      (ORGANIZATION DPP/NNP)
      's/POS
      losses/NNS
      has/VBZ
      convinced/VBN
      many/JJ
      (GPE Taiwan/NNP)
      commentators/NNS
      that/IN
      it/PRP
      will/MD
      be/VB
      very/RB
      difficult/JJ
      for/IN
      the/DT
      (ORGANIZATION DPP/NNP)
      to/TO
      win/VB
      the/DT
      2020/CD
      presidential/JJ
      election/NN
      ,/,
      either/RB
      with/IN
      (PERSON Tsai/NNP)
      or/CC
      another/DT
      candidate/NN
      ./.
      If/IN
      the/DT
      (ORGANIZATION KMT/NNP)
      once/RB
      again/RB
      returns/NNS
      to/TO
      power/NN
      ,/,
      (GPE Beijing/NNP)
      will/MD
      reap/VB
      a/DT
      big/JJ
      win/NN
      with/IN
      clear/JJ
      implications/NNS
      for/IN
      regional/JJ
      stability/NN
      ./.
      The/DT
      (GPE Taiwan/NNP)
      Strait/NNP
      remains/VBZ
      one/CD
      of/IN
      the/DT
      most/RBS
      dangerous/JJ
      hotspots/NNS
      in/IN
      (GPE East/NNP Asia/NNP)
      ./.
      Re-stabilized/JJ
      cross-strait/JJ
      relations/NNS
      will/MD
      no/DT
      doubt/NN
      tone/VB
      down/RP
      the/DT
      likelihood/NN
      of/IN
      military/JJ
      conflicts/NNS
      ,/,
      thereby/RB
      removing/VBG
      a/DT
      major/JJ
      security/NN
      challenge/NN
      for/IN
      (GPE China/NNP)
      ./.
      The/DT
      prospect/NN
      of/IN
      a/DT
      possible/JJ
      (ORGANIZATION KMT/NNP)
      victory/NN
      in/IN
      the/DT
      2020/CD
      presidential/JJ
      election/NN
      may/MD
      also/RB
      motivate/VB
      (GPE Beijing/NNP)
      to/TO
      rekindle/VB
      its/PRP$
      vision/NN
      for/IN
      a/DT
      ``/``
      peaceful/JJ
      reunification/NN
      ''/''
      with/IN
      (GPE Taiwan/NNP)
      ./.
      For/IN
      example/NN
      ,/,
      during/IN
      Ma/NNP
      Ying-jeou/NNP
      's/POS
      reign/NN
      ,/,
      (GPE Beijing/NNP)
      tried/VBD
      to/TO
      complete/VB
      a/DT
      ``/``
      peace/NN
      treaty/NN
      ''/''
      between/IN
      the/DT
      two/CD
      sides/NNS
      as/IN
      a/DT
      first/JJ
      step/NN
      toward/IN
      long-term/JJ
      political/JJ
      union/NN
      ./.
      A/DT
      setback/NN
      for/IN
      (GPE Washington/NNP)
      The/DT
      (ORGANIZATION DPP/NNP)
      's/POS
      defeat/NN
      and/CC
      a/DT
      possible/JJ
      bigger/JJR
      defeat/NN
      in/IN
      the/DT
      2020/CD
      presidential/JJ
      election/NN
      also/RB
      imply/VBP
      strategic/JJ
      setbacks/NNS
      for/IN
      the/DT
      (ORGANIZATION Trump/NNP)
      administration/NN
      ,/,
      which/WDT
      is/VBZ
      pursuing/VBG
      a/DT
      new/JJ
      (GPE China/NNP)
      policy/NN
      ./.
      While/IN
      successive/JJ
      (ORGANIZATION US/NNP)
      governments/NNS
      since/IN
      the/DT
      1970s/CD
      have/VBP
      adopted/VBN
      a/DT
      ``/``
      One/CD
      (GPE China/NNP)
      ''/''
      policy/NN
      ,/,
      the/DT
      (ORGANIZATION Trump/NNP)
      administration/NN
      has/VBZ
      been/VBN
      tightening/VBG
      its/PRP$
      diplomatic/JJ
      and/CC
      security/NN
      relations/NNS
      with/IN
      (GPE Taiwan/NNP)
      ./.
      While/IN
      denying/VBG
      any/DT
      intention/NN
      to/TO
      contain/VB
      (GPE China/NNP)
      ,/,
      (GPE Washington/NNP)
      's/POS
      new/JJ
      (GPE China/NNP)
      policy/NN
      nonetheless/RB
      seeks/VBZ
      to/TO
      maximize/VB
      leverages/NNS
      to/TO
      limit/VB
      (GPE China/NNP)
      's/POS
      power/NN
      and/CC
      influences/NNS
      ./.
      (GPE Taiwan/NNP)
      voters/NNS
      reject/VBP
      same-sex/JJ
      marriage/NN
      (GPE Taiwan/NNP)
      voters/NNS
      reject/VBP
      same-sex/JJ
      marriage/NN
      (GPE Taiwan/NNP)
      naturally/RB
      fits/VBZ
      well/RB
      within/IN
      that/DT
      ./.
      In/IN
      particular/JJ
      ,/,
      the/DT
      (ORGANIZATION DPP/NNP)
      's/POS
      antagonistic/JJ
      stand/NN
      against/IN
      (GPE China/NNP)
      creates/VBZ
      the/DT
      perfect/JJ
      synergy/NN
      with/IN
      (GPE Washington/NNP)
      's/POS
      (GPE China/NNP)
      policy/NN
      ./.
      The/DT
      prospect/NN
      of/IN
      (ORGANIZATION KMT/NNP)
      winning/VBG
      the/DT
      2020/CD
      election/NN
      will/MD
      no/DT
      doubt/NN
      undermine/VBP
      (GPE Washington/NNP)
      's/POS
      (GPE China/NNP)
      policy/NN
      ./.
      While/IN
      various/JJ
      (ORGANIZATION KMT/NNP)
      governments/NNS
      in/IN
      the/DT
      past/NN
      had/VBD
      very/RB
      good/JJ
      relations/NNS
      with/IN
      the/DT
      (GSP US/NNP)
      ,/,
      the/DT
      party/NN
      's/POS
      traditional/JJ
      approach/NN
      to/TO
      cross-strait/JJ
      relations/NNS
      will/MD
      make/VB
      it/PRP
      less/RBR
      motivated/JJ
      to/TO
      work/VB
      with/IN
      the/DT
      (GSP US/NNP)
      to/TO
      contain/VB
      a/DT
      rising/VBG
      (GPE China/NNP)
      ./.
      The/DT
      (ORGANIZATION DPP/NNP)
      's/POS
      electoral/JJ
      defeat/NN
      therefore/NN
      carries/VBZ
      far/RB
      larger/JJR
      consequences/NNS
      that/WDT
      transcend/VBP
      the/DT
      island/NN
      itself/PRP
      ,/,
      including/VBG
      major/JJ
      implications/NNS
      for/IN
      both/DT
      (GPE China/NNP)
      and/CC
      the/DT
      (GPE United/NNP States/NNPS)
      ./.
      Their/PRP$
      respective/JJ
      strategic/JJ
      interests/NNS
      are/VBP
      deeply/RB
      embedded/VBN
      with/IN
      (GPE Taiwan/NNP)
      's/POS
      domestic/JJ
      political/JJ
      situations/NNS
      ./.
      In/IN
      that/DT
      sense/NN
      ,/,
      (GPE Taiwan/NNP)
      is/VBZ
      a/DT
      key/JJ
      battleground/NN
      for/IN
      the/DT
      rising/VBG
      rivalry/NN
      between/IN
      the/DT
      two/CD
      great/JJ
      powers/NNS
      ./.)
    


```python
def get_continuous_chunks(text,label):
    chunked = ne_chunk(pos_tag(word_tokenize(text)))
    prev = None
    continuous_chunk = []
    current_chunk = []
    for subtree in chunked:
        if type(subtree) ==Tree and subtree.label() == label:
            current_chunk.append(" ".join([token for token, pos in subtree.leaves()]))
        elif current_chunk:
            named_entity= " ".join(current_chunk)
            if named_entity not in continuous_chunk:
                continuous_chunk.append(named_entity)
                current_chunk=[]
            else:
                continue
                
        return continuous_chunk      
```


```python
get_continuous_chunks(strEx, 'GPE')
```




    []




```python
get_continuous_chunks(strEx, 'ORGANIZATION')
```




    []




