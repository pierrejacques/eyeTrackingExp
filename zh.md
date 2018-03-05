# 用热图信息熵预测网页美感
## 摘要

如今眼动仪被广泛地运用在用户界面的评估中，然而对眼动数据进行的美感角度的分析和解读仍是困难的。为了在眼动数据和美感之间找到联系，我们研究了三十位参与者对40张网页最初曝光的3秒时间内的眼动数据。他们也对这些网页页面进行了评分。
我们引入了香农信息熵来分析眼动实验数据。结果表明，基于眼动热图的信息熵（视觉重点熵）与被试对网页的美感评分之间有着显著的相关性。视觉重点熵可以被解释为被试在视觉信息处理过程中的流畅性或是混乱性。它的改进指标——相对视觉重点熵，对美感表现出了更高的相关性(r=-0.65, F=26.84, P=0.7e-6)。仅仅这样的一个单一指标就对实验网页做出了87.5%的好坏区分正确率。进一步的研究表明，视觉重点熵和相对视觉重点熵与美感的相关性表现从眼动曝光的大约1秒左右开始变得稳定。相关曲线暗示更长的实验时间可能会取得更好的实验结果。

## 关键字
熵，视觉注意力，眼动，美学，网页

## 背景介绍
对一个网站来说，美感是吸引用户的重要因素。大数据研究表明绝大多数的用户在进入一个网页的初始几秒内就决定去留[]。而好看的网页带给用户更强的可信感[]，看起来更好用[]。
审美（Aesthetics）一词的词源来自希腊语，表示“观察”。人的视觉系统——眼球和其连接的大脑皮层，使我们能够观察和发现周遭的美。人眼的行为就像一盏聚光灯[]：拥有一个狭窄而高精度的中央视觉，环绕着一个广阔而低精度的周围视觉。我们的视觉注意力决策这盏聚光灯的移动方向，聚焦到人脸、文字、屏幕上的图片等各类有意义的目标上去，从杂乱的背景中提取出有效的信息。通过不停地从一个注意点和跳转到下一个注意点，发掘零碎的有效信息，最终能在脑内形成一个对观察物的整体的印象。
眼动仪被设计用于记录注视和眼动。在可用性和推销的研究中，它被广泛地用来评估关键信息的可达性。虽然这往往很有用，但对于用户体验研究而言，仍然显得过于局限。
有没有可能通过眼动数据来预测一个网页的美感满意度呢？为了回答这个问题，我们作了很多努力。证据表明，眼动数据确实拥有对观察者的美感体验的一定的推测能力，答案是肯定的。
四十张网页对三十个被试的视觉曝光，被独立地用眼动仪记录下来。每个页面向每个被试者曝光3000ms，之后他们每人分别对每个网页基于自己的审美给出美感评价。香农信息熵在眼动实验数据的分析中被引入。结果表明基于用于可视化视觉重点分布的热图的信息熵与用户给出的美感评分表现出了显著的相关性(r=-0.65, F=26.84, P=0.7e-6)。仅仅这一项单一指标可以对网页的美感好坏作出87.5%的分类正确率。熵在这里代表一种对视觉注意过程中的混乱度的客观量化，从而能够作为流畅理论[]的一个直接证据。流畅理论认为美感基于观察者的视觉处理体验，视觉处理体验越是流畅，美感反馈越是积极。

## 相关工作
### 眼动与美学实证研究
在眼动与美感的研究方面的一个很自然的思路是“眼动行为能一定程度上反映我们对视觉刺激物的感受”。
在考察眼动与对艺术品的美感评价之间的联系方面，Berlyne[]认为美感评价是基于整体而多样的探索和局部而具体的信息采集两种探索性视觉行为的。前者具有较广的范围和较短的注视时长，反之后者具有较小的范围和较长的注视时长。Berlyne提出这种由注视时长和扫视范围交替构成的眼动探索模式对于图片的美感满意度的评价是至关重要的，该探索性视觉的理念进一步影响了如下的研究。Locher[]发现简单地对一个抽象组合对象的色彩平衡进行调整会造成眼动注视分布和视觉路劲的改变；Franke et al[]发现更受好评的三维渲染图像往往有更多的眼动注视个数和更长的注视时长；Plumhoff[]发现对于好的图像，眼动注视的时长更长，眼动扫视的范围随时间表现出更大的变化；Wallraven et al[]分析了20名被试对275个不同时期的艺术作品的眼动数据，发现不同风格的作品的眼动注视个数和时长之间存在较强的差异；Massaro et al[]对美术作品进行归类（彩色的、灰度的、人文的、自然的），并以此作为研究视觉注意力中自底向上和自定向下过程的贡献的实验材料；Khalighy et al[]通过三组基于抽象图像和产品设计的眼动实验推导出一个关于美感的经验公式，他认为美感与注视的个数和注视时长之间的方差的乘积呈正比。
上述的研究解释了眼动追踪技术对于多种形式对象的美感研究的潜在可能性，他们的成果基本没有超出Berlyne的想法：诸如更多的注视个数、更长的注视时长、随时间更富变化的扫视范围等实验结果，仅仅确认了Berlyne的观点——对于具有更高美感评价的对象会获得更活跃而动态的眼动行为反馈。事实上，这些结果很难通过美学的角度去进行合理的解释。尽管眼动仪已经成为美学研究的新装备，但到目前为止，就眼动行为是如何与美感反馈产生联系的仍然缺乏深入和令人信服的解释。
### 眼动与网页美感
网页美感的研究主要都聚焦在从网页中提取具有美感推测力的特征上（例如复杂度[]），并取得了一定的成果。Ivory和Sinha[]、Zhang et al.[]、Reinecke et al.[]通过低级的图像特征来预测感知视觉复杂度和彩度，并发现它们与人们的美感评价高度相关。
眼动仪被广泛用来评估对网页上特定元素的视觉注意度，然而现有的眼动数据的可视化和分析手段与美感相关的用户体验没有任何关联，关于眼动和美感的关系仍有待证实[]。眼动仪能否提供一个更为普遍的度量观者的美感体验的手段？我们需要通过美学的视角借助一些数据挖掘的手段，来从眼动数据中提取出更多的可解释的指标。
## 理论框架
我们的设想源自流畅理论[]。
浏览一个网页的过程本质上是人类的视觉系统处理一张图像的过程。如何来评估这种视觉处理的流畅性呢？我们可以通过视觉处理管道的入口，神经和认知系统的上游——视觉注意，来入手。
根本上，视觉注意可以定义为从全部可达的信息中选出一个用于进一步处理的子集的过程。视觉注意持续地通过自底向上（视觉重点）和自定向下（诱人的内容）的方式在外围视力中选择目标。
如果流畅理论成立的话，则注意过程将是美感评价的途径。那么又如何评估视觉注意的流畅性呢？一个合理的流畅的是视觉注意应满足：
1. 在面对多个视觉注意线索时，更少冲突地作出选择
1. 在面对局部视觉重点时，更聚焦地趋向一个兴趣点
本研究中，我们引入熵的概念来量化视觉注意行为的混乱度（不流畅性），并探究它是否跟美感评价相关。同时也会考察一些已被提出的指标。
熵将被应用在眼动数据的以下两个方面：
- 眼动注意的转移序列的熵：反映注意力在多个视觉重点间转移的复杂度和不确定性
- 眼动注意的热图熵：反映眼动注意在空间分布上的分散度和混乱度。
## 实验与数据
我们的实验模拟视觉自然而突然地降落到网页页面上。唯一不自然的部分是被我们称为“限时曝光”的形式，这种方式将强制被试对页面进行快速而全面的视觉探索而不是具体而局部的信息收集。在三张用于适应性缓冲的网页过后，被试者将意识到他们只有几秒钟的时间来看每一张展示的页面。这样的设计的合理性在于，正如我们所已经知道的，为了避免在糟糕的页面上的无意义停留，用户习惯于在到达一个新的页面的几秒钟内作出去留的决定。
对于研究早期的无意识的注视行为而言，几秒钟的限时曝光就已足够。同时，这种方式避免了因被试者的视觉疲劳而造成的误差。
### 设备
实验使用的眼动设备是Tobii的T50眼动仪和配套的Tobii Studio软件。该眼动仪的屏幕分辨率是1280\*1024px。
### 实验样本
实验采用对40张网页页面的截图作为测试的样本。为了让这些页面对好/坏的美感更具有代表性，我们通过[the best designs](https://www.thebestdesigns.com)和[websites from hell](https://websitesfromhell.net)两个网站来分别采集好的页面样本和坏的页面样本。只采集了这两个网站上的基数页面。
包含广为人知的图标或人脸以及包含非拉丁字符的页面被筛除以避免来自非美学的社会因素的干扰。最终我们从上述两个网站个筛选出20个网页，并在1280\*800的分辨率下对他们进行截图以匹配我们使用的眼动仪的分辨率。截图包含了网页浏览器的窗口。[图]展示了实验用到的所有的样本页面。
### 被试者
一共30名被试者（13男，17女）参与了眼动实验。他们都是来自上海交通大学不同院系的学生。除去一些学生来自韩国的学生，其余的学生都来自中国。他们的年龄段在19到27岁之间。
### 实验环境
实验在一个安静的房间内进行。房间的窗帘被拉上考虑到不可控的自然光源可能造成屏幕反光。眼动仪被放置在一面纯白色的墙壁前以避免可能的注意力分散。
### 实验过程
每名被试被要求以平时闲逛网页的状态来浏览被试的网页样本。被试身体略微前倾地坐在一张办公椅上,放置他或她的下巴到一个高而柔软的支撑物上并调整位置以使实现距眼动仪的屏幕60厘米。被试的手肘自然放置在，一首握着鼠标，虽然该鼠标的动作不会带来交互行为。
为了减少疲劳，实验被分成时隔一分钟休息的两阶段进行。每阶段眼动仪随机展示所有40张样本页面中的一半。每张页面只展示3秒钟，紧接着是一个1秒钟的黑屏作为缓冲。每个阶段最开始都会展示三张不参与实验的假页面作为缓冲，以使被试适应实验的节奏。被试在整个实验过程中不会受到任何的提示和干扰。
对实验样本页面的主观评分被安排在所有眼动实验结束之后，与之分离。在评分过程中，被试将再次无时限地浏览每一张样本网页，通过“好”和“坏”两个选项来评价每一张页面美感体验。
所有的被试都确认他们从未见过任何一张实验样本页面。
### 数据采集
实验结束后，每张样本页面都根据其获得的“好评”的比例获得一个介于0-1之间的美感得分。[图]展示了所有40张样本页面在美感得分上的频率分布直方图。
评分结果显然呈现出了二值化的特征。20张评分低于0.5的页面和来自[websites from hell](https://websitesfromhell.net)的页面完全重合。即从美感角度而言，这些页面是毫无疑问的“坏”页面。
眼动数据方面，T50眼动仪通过一个固定的50Hz的频率采集被试眼睛的聚焦位置。通过差值算法获得连续的眼动速度，然后通过阈值来确定眼动注视在哪段时间内发生（眼动速度几乎等于0的时段）。
通过眼动仪获得的原始数据是有一系列的注视构成的。每个注视包含了四个参数信息：开始时间、持续时长、在屏幕上的横纵坐标位置。后续我们将基于这种形式的原始眼动数据展开分析。

## 分析
### 传统的眼动指标
首先，对我收集到的眼动数据，我们试验一些传统的描述性指标。这些指标大部分都在先前提到的研究中被提及：
- 注视的个数
- 平均注视时长
- 注视时长的标准差
- 平均扫视距离
- 扫视距离的标准差
- AOI个数
- AOI中注视的平均个数
- AOI中注视个数的标准差
上面提到的AOI是Area of interests的缩写，表示视觉兴趣点，是通过对页面上捕捉到的所有注视进行空间聚类得到空间区块。我们采用Tobii Studio软件包中自带的默认AOI聚类算法来获得这些AOI区块。[图]以参与实验的一张样本页面为例，标出了它的AOI聚类情况。
[表]列出了参与计算的所有传统指标在与美感评分的关联性方面的表现，包括每个指标与评分的线性相关系数和对好坏页面组别进行方差分析的p值。在0.05的置信系数上，只有注视个数通过了方差检验（p = 0.04）。注视个数表现出了微弱的与美感评分的正相关性，也即在相同的曝光时间内，好看的页面普遍获得了更多的眼动注视，拥有更活跃的眼动反馈。
### 眼动过程中的熵
熵在信息论和热力学中用来表达一个系统的混乱度、无序性，或者反过来说有序性、确定性。
本研究中的视觉熵的概念是基于香农的信息熵理论的。信息熵是基于概率空间的一种对不确定性的度量。对一个在离散的概率空间\Omega上具有概率分布P的随机变量X，信息熵H定义为[公式]
H(X)越大，X的分布就更混乱度而不确定，反之则X的分布就更有序而确定。
接下来我们借助信息熵来分析眼动两个维度：眼动在AOI间的跳转和注视在空间上的分布。
#### 注视转移中的熵
最早在Tole et al[]的关于认知负担的研究中把熵的概念引入到眼动数据的分析中。他用熵来描述11名飞行员在执行不同任务时观察行为的变化。该模型在之后也被应用在一项关于驾车时的眼动行为的研究中。[]
Hooge[]使用一种类似的称之为“视觉路径熵”（scan path entropy）的概念来度量对一个特定视觉兴趣点的眼动一致性。
下面我们依照Tole的基于马尔科夫链的视觉熵的定义，分析其与美感评分的关联性。
这种熵描述了眼镜在注视之间转移的确定性。在实验中，注视的位置的概率空间的大小是1024\*800，等同于屏幕的分辨率。如此庞大的概率空间使得不同被试之间的眼动序列无法进行比较。对此，Tole的做法是把整个视觉范围人为分割为一些的区域。在本实验中，我们借助系统自动聚类生成的AOI来完成这种区块划分，并考察眼睛在这些AOI间的跳转。跳转是由视觉注意机制所驱动的，在无意识的情况下从当前的目标切换到外围视觉的目标[]，这也就是Berlyne所提出的全面视觉探索的意思。通过AOI对注视的聚类，我们可以将来自原始数据的每个被试的注视跳转转化为AOI之间的跳转。[表]

_眼动的马尔科夫性_
如果一个离散时间序列`X1,X2,X3,...`满足`P(X_n+1 = x | X_1 = x_1, X_2 = x_2, ..., X_n = x_n) = P(X_n+1 = x | X_n = x_n)`，则称之为一个离散马尔科夫链。对于眼动的AOI序列，其马尔可夫性可以简单地解释为下一个注视的AOI只与当前注视的AOI有关。
对于一个马尔科夫序列，其全部的转移概率信息可以通过一个一步转移概率矩阵来表示。
在假设眼动的马尔可夫性成立的前提下，实验中的一个页面上的AOI之间的一步转移概率可以通过统计其在被试的眼动数据中的出现的概率来获得。[表]中展示了[图]中举例页面的11个AOI之间的一步转移概率矩阵：
矩阵中，`p_ij`表示在当前注视在视觉兴趣点i的前提下，跳转到视觉兴趣点j的转移概率。
在此转移概率矩阵的基础上，眼动熵如下定义
```
  H = sum(pi*sum(pij * log2(pij)))
```
其中`p_ij`表示从视觉兴趣点i跳转到视觉兴趣点j的条件概率。`p(i)`表示注视在视觉兴趣点i上的先验概率，即从视觉兴趣点i开始进行下一步跳转的概率，通过统计视觉兴趣点i被注视到的概率来估计。
极大熵`H_max`表示在一个页面的AOI个数的前提下，可能出现的最大视觉转移熵。可以通过假设所有的先验概率和转移概率都相等来获得。用上述的视觉熵除以极大熵获得的相对视觉熵令不同的页面之间的结果具有可比性。
```
  H_relative = H / H_max
```
上述的视觉熵可以度量视觉兴趣点之间一次转移的确定性。我们期望美感评分高的页面相对低的页面会有更小的视觉熵。然而结果是令人失望的。基于我们的3秒钟曝光的眼动数据，熵与美感评分间的线性相关系数只有0.1585，好坏两类之间的方差检验的p = 0.4741。

[表格]()

对于上述熵与美感没有显著关联性的可能解释如下：
- 统计一次的马尔科夫转移跳转的熵的模型可能过于简化了，然而通过更多转移步长将大大减少可用于概率估计的数据量。
- AOI的聚类算法可能丢失了一些信息并产生了一些AOI的不合理聚类。
#### 基于热图的熵
上述的基于马尔科夫链的熵把眼动行为理解成由注视和扫视（转移）构成的一系列相关事件。
这里我们引入一种新的基于最广泛应用在眼动数据中的可视化手段[]——热图的熵的概念。与之前用来计算熵的眼动转移序列不同，热图没有包含任何有关注视顺序的信息，这意味着新的熵度量是独立看待所有的眼动注视的。

[图]()

考察代表眼动注视的位置的二维随机变量`(X, Y)`，则它的概率空间就是屏幕的分辨率空间（即把屏幕上的每一个像素认为是注视的一种可能的位置选择）。基于作用在该随机变量上的概率分布`P(X, Y)`，可以如下定义熵：
```
  H(P) = ...
  其中
  \sum(\sum)...
```
而`(X, Y)`的概率分布`P(X, Y)`，实际上就是眼动热图，可以通过眼动数据进行估计。
热图的这种熵可以反映被试的眼动在空间上的分布的一致性或者凝聚度：当所有的注视聚焦在同一个像素上时，产生最小的熵值、让所有的注视平均地分散在屏幕上时，产生最大的熵值。
通过引入高斯核对每个注视点在空间上进行模糊处理，可以实现用少量的眼动采样据来估计注视在屏幕上的空间分布。
对一个屏幕横坐标位置为`x_0`，纵坐标位置为`y_0`，持续时长为`d`的眼动注视，它产生的高斯核可以表达为
```latex
  d*exp(-[(x - x_0)^2 + (y - y_0)^2]/2\sigma^2)
```
其中`\sigma`是高斯核的标准差。注意到上述的表达式并非标准的归一化的正态分布表达式，因为最终通过这些高斯核叠加得到的分布`P(X, Y)`还要进行归一化处理，以满足`\sum\sumP(X, Y) = 1`.
除了用有限数据估计概率分布的需要之外，引入高斯核叠加的合理性还体现在人眼的注视事实上是与人眼的黄斑对应的具有一定半径的圆形范围，而实际的眼动注视也并非绝对固定不动而是包含一些微动行为的[]。另外考虑到眼动仪的检测本身具有一定的误差范围，高斯叠加的做法也令指标对误差具有一定的容忍度。[图]()展示了`\sigma=30px`时的热图的形态。
通过对40张实验页面的热图的熵的计算，发现其与美感评分表现出显著的负相关性（r = -0.5412, ANOVA F = 15.79 P = 0.0003。

[表]()

到目前为止，基于热图的熵是与美感表现出最强相关性的指标。鉴于热图有时会被认为是视觉注意的分布图，我们把上述定义的基于热图的熵称作视觉注意熵（Visual Attention Entropy, VAE）。
####  相对VAE
对于上面得到的VAE指标，存在着一定的理论缺陷。VAE与美感评分是负相关的，然而一个绝对低的VAE值并不意味着一个相当高的美感评分：一个只拥有相当少的内容的页面可能会得到一个相当低的VAE值，反之一个铺满内容的页面可能有相当高的VAE值，但显然这并不意味着前者一定比后者好看。理论上，具有不同内容复杂度的页面之间是无法通过VAE进行比较的。
为了解决该问题，我们引入了我们称之为相对VAE(relative, rVAE)的概念。为了让不同的页面的VAE可比较，需要首先考察他们各自的基础视觉注意熵（base VAE， bVAE）。对于一个页面，bVAE通过统计所有的被试各自的VAE的平均值得到，代表着一个无噪声扰动的VAE情况，是该页面的必要视觉注意成本。
```
  bVAE = 1/n \sum VAE(P_i)
```
其中`n`是被试人数，`VAE(P_i)`表示第`i`个被试的个体眼动注意熵。以bVAE作为一个先决条件，可以定义如下的相对视觉注意熵rVAE：
```
  rVAE = VAE / bVAE
```
与VAE相比，rVAE与美感评分的关联性有显著提高，线性相关系数从-0.54提高到了-0.66。ANOVA F = 26.84 P = 0.000008。

[表]()

[公式]()似乎表明，bVAE越大则rVAE越小，则美感评分理应越高。但事实上，由于它们之间的显著的相关性（r = 0.77）[表]()，拥有较高的bVAE的页面很可能也会有较高的VAE。

[表]()

上述关键指标间的相关性分析表明，bVAE与美感评分几乎没有相关性，但与注视的个数有较为显著的相关性。[图]()列出了所有的页面的个体VAE的盒图。

[图]()

bVAE的引入使得具有不同内容复杂度的页面的VAE变得可比较，并提供了对他们的美感评分的更为精确的预测。
[图]()展示了VAE和rVAE的ANOVA盒图。[图]()展示了所有40张实验页面的美感评分分别关于VAE和rVAE的散点图。相比VAE，rVAE在区分好坏页面上具有更好的表现。
### 例外
比较[图]()中的两张散点图我们发现总体而言相比VAE，rVAE使得好坏两组页面分得更开了，然而仍有一些被勿分类的页面。一个标注为24号的页面从整体的趋势中明显脱离，它有不错的美感评分，却在VAE和rVAE上都比较高。
[图]()左面给出了这张页面的原始样本，不得不承认这张页面看起来还是不错的，包含了很多富有吸引力的因素如：漂亮的图片、色彩、平衡的布局等等。然而从一个设计师的角度，它还有不小的提升空间。全屏来看这张页面时，眼睛会感到一定的选择压力。这可能是因为视觉外围的一些密集的高对比造成的。[图]()的右面给出了这张页面经过细微版式调整后的版本。它阐明了细微的细节改动是如何改变给人的第一印象的。VAE本质上是受画面的边缘对比、复杂度等底层低级特征影响的，因而我们相信它能够表现观察者的视觉不适。可以肯定的是，我们通过VAE进行度量的视觉注意的流畅性美感判断具有不小的影响力。当然它也并非美感的全部。
### VAE的稳定性
为了优化VAE的表现，我们分别考察熵与美感的相关性随着实验时间、纳入计算的被试人数以及热图高斯核的标准差的变化。
对给定的时刻t，我们统计发生在0-t时间段的眼动注视，并基于此计算VAE和rVAE，由此得到VAE和rVAE分别关于时间的变化的曲线。所有的曲线在开始时都表现出了较大幅的波动，然后逐步趋于稳定和平缓。[图]()表现了实验页面的VAE随时间增大，rVAE随时间减小的趋势。
蓝色的曲线代表美感评价好的网页而红色的曲线代表美感评价坏的网页。显然好的页面随时间持续地有更小的VAE和rVAE值。此外在最后的时刻好坏的两个类别分的更开了。

[图]()

[图]()

[图]()展现了熵和美感评分的相关系数随时间变化的曲线，在三秒的时刻相关系数取得了极值。由于我们没有记录3秒后的眼动数据，故没有办法看到后续的发展趋势。以母线的增长趋势，我们猜测相关系数可以变得更强。
[图]()展现了熵与美感评分的相关性随着被纳入计算的被试人数的增长而逐渐趋于稳定的趋势。图中的曲线结果是通过每次纳入一名随机被试的眼动数据获得的。似乎更多的被试人数会获得更好的与美感评分的关联性，但同时也以为着更高的时间成本和实验开销。

到目前为止我们的所有关于熵的计算都是基于热图高斯核`\sigma = 30`的基础上进行的。那么熵与美感的相关性对`\sigma`变化的敏感度如何呢？
[图]()展现了相关系数随高斯核的平滑变化。在相当大的一个`\sigma`取值区间内，VAE和rVAE的表现都很稳定。VAE在13px-60px的区间内都有低于-0.5的与美感评分的相关系数；rVAE在10px-120px的区间内都有低于-0.6的与美感的相关系数。故熵的表现对于`\sigma`的取值是不敏感的。

[图]()

上述的分析证实了VAE和rVAE在对美感的推测力方面的稳定性。并且看来，通过加长实验时间、扩大被试的规模和选择合适的`\sigma`取值，它们的表现还可以更好。
## 讨论与结论
实验证实了人的美感判断与眼动行为的确存在着联系。对注视序列和热图两个维度的香农熵的探索尝试表明，基于热图的视觉注意熵VAE对美感具有一定的推测里而基于马尔科夫假设的注视序列的熵则没有。VAE，视觉注意熵，可以解释成在分配有限的注意力资源时的混乱度。而他的改进版指标，rVAE，相对视觉注意熵，与我们的感知的美感有显著的相关性(r = -0.65)。仅仅这单个指标对页面的美感好坏就有相当程度的预测力。
VAE的成功的一部分因素归功于通过高斯核进行的插值，认为眼动注视的分布是连续的。同时3秒内的所有注视都投影在单个平面上，令数据密度更高。而注视序列熵失败的也许可以归咎于其基于时间的统计方式导致的数据量的稀疏。此刻仍很难说它与人的美感判断是无关的。也许未来可以找到更适用的模型来解决这个问题。
一个较低的VAE可以解释人们在眼睛动向和搜索上更少的代价付出。实验中好的网页拥有更小的VAE的趋势支持了流畅理论[]的说法，并一定程度上解释了为什么“好看的就是好用的”[]。VAE是基于眼动注视中的特定信息的。作为一个新的客观的眼动数据量化指标，它显然不仅仅是美感的一种度量，自然中的VAE与我们的观察和驾驶能力更相关。视觉注视在功能性上与鼠标指向很相似，这在一定程度上解释了为什么一些视觉引导相关的设计原则与Fitts规则（选择层级代价经验公式）很相似。
rVAE可以被理解成在屏幕范围的限制下用尽可能小的视觉注意代价（即VAE）去获取尽可能多的信息量（即bVAE）。这与基于进化论美学的“最大效益最小手段”的美学原则是一致的。进化论美学认为人类是为了提高生存和繁衍的成功率而进化出基础审美能力的。
眼动代表了显性和隐形注意的一种合作。虽然我们发现通过眼动行为来预测一个页面的美感至少需要约1000ms的眼动数据，我们对页面的第一印象的产生却只需要50-500ms[]。事实上，50ms仅仅足够完成一个对页面的快速“截屏”，我们的眼睛仍然停留在原地不动。这表明大脑可以通过50ms曝光的残留印象形成的隐形注意热图就作出美感的评价。