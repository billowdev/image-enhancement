# Image-Enhancement
Digital Image Processing Enhancement


#### >> M_71CS63112_extract_intensity.m
<pre>
% หาและพล็อตฮิสโตแกรมของภาพ โดยแบ่งระดับเทาออกเป็น 10 ช่วง
</pre>

#### >> M_72CS63112_compare_Hist.m
<pre>
% เปรียบเทียบฮิสโตแกรมของภาพในข้อ (1) กับฮิสโตแกรมที่ได้จากการใช้คำสั่ง imhist
</pre>

#### >> M_73CS63112_Contrast_Stretching.m
<pre>
% ทำการยืดคอนทราสตามสมการ (7.2)
</pre>
<this for img72>

#### >> M_74CS63112_Bit_extraction.m
<pre>
% ขบวนการ Bit extraction 16 บิต
</pre>

#### >> M_75CS63112_negative_white.m
<pre>
% กลับภาพขาวเป็นดำ ดำเป็นขาว
</pre>

#### >> M_76CS63112_Spatial_Averaging.m
<pre>
% การเฉลี่ยแบบสเปเชียล (Spatial Averaging) โดยใช้วินโดว์ในรูป 
</pre>
###### ref:
- https://www.dynamsoft.com/blog/insights/image-processing/image-processing-101-spatial-filters-convolution/

#### >> M_77CS63112_Median_Filtering.m
<pre>
% ทำการฟิลเตอร์แบบค่ามีเดียน (Median Filtering) โดยใช้ขนาดวินโดว์ 5x5
</pre>
###### ref:
- https://www.researchgate.net/figure/Median-Filter-of-3x3-5x5-7x7-9x9-and-11x11-of-Sliding-Window-Concept_fig4_282295704
- https://www.imageeprocessing.com/2011/03/matlab-program-2d-median-filtering-for.html

#### >> M_78CS63112_LPF_ButterworthLPF.m
<pre>
% เขียนคำสั่ง Matlab เพื่อทำการปรับปรุงภาพในฟรีเคว็นซีโดเมน 
% เพื่อทำการฟิลเตอร์ความถี่ ต่ำผ่านแบบ (i) อุดมคติ และ (2) 
% บัตเตอร์เวิร์ท โดยที่ทรานส์เฟอร์ฟังก์ชันของฟิลเตอร์ความถี่ต่ำผ่านมีขนาด 256x256 
% และความถี่คัตออฟเท่ากับ 64 หน่วย
</pre>

#### >> M_79CS63112_HPF_ButterworthHPF.m
<pre>
% เขียนคำสั่ง Matlab เพื่อทำการปรับปรุงภาพในฟรีเคว็นซีโดเมน 
% เพื่อทำการฟิลเตอร์ความถี่สูงผ่าน แบบ(i) อุดมคติ และ (2) บัตเตอร์เวิร์ท 
% โดยที่ทรานส์เฟอร์ฟังก์ชันของฟิลเตอร์ความถี่สูงผ่านมีขนาด 256x256 
% และความถี่คัตออฟเท่ากับ 64 หน่วย
</pre>

#### >> M_710CS63112_Unsharp_Masking.m
<pre>
% เขียนคำสั่ง Matlab เพื่อทำการปิดบังความไม่คม (Unsharp Masking)
</pre>

#### >> M_711CS63112_Magnification_Interpolation.m
<pre>
% เขียนคำสั่ง Matlab เพื่อทำการขยาย (Magnification) 
% หรือ ซูม อันดับที่ 4 โดยใช้เทคนิค (i) การซ้ำ และ (ii) 
% การอินเตอร์โพเลชันแบบเชิงเส้น
</pre>

#### >> M_712CS63112_Psudo_Coloring.m
<pre>
% เขียนคำสั่ง Matlab เพื่อทำขบวนการ Psudo-Coloring ด้วยเทคนิค (i) 
% intensity Slicing และ (ii) เทคนิคการใช้ฟังก์ชัน | cos(x + ɸ) |
</pre>
###### ref:
- https://www.mathworks.com/matlabcentral/fileexchange/28355-pseudocolor-image-processing

###### % Psudo-Coloring ด้วยเทคนิค (i) intensity Slicing
- https://www.sciencepubco.com/index.php/ijet/article/download/19707/9140

###### % (ii) เทคนิคการใช้ฟังก์ชัน | cos(x + ɸ) |
- https://www.mathworks.com/help/matlab/ref/pcolor.html
