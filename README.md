## **项目目标**
>1.该项目将实现一个基于`MIPS`指令集架构的32位CPU模型，设计将有5级流水线以及必须的IO接口。该项目最终将在Xilinx的FPGA开发板上测试并使用。  
>2.在硬件设计与验证完成后，将在其上移植一款已有的2位开源3操作系统。  
>3.在该项目完成后，将尝试自制一套简易的32位操作系统并移植其上。 
---- 
## **项目目的**
>1.该项目旨在通过实践设计CPU，将课上的理论知识与实际相结合，来深入理解计算机的组成结构以及工作原理。  
>2.通过该项目，学习并练习Verilog语言的开发方法，Vivado环境的使用以及FPGA平台的基本开发方法。 
----
## **参考资料**
>*1.《自己动手写CPU》 雷思磊著，电子工业出版社*  
>*2.《数字设计和计算机体系结构》 David Money Harris等著， 机械工业出版社*  
>*3.[MIPS官方参考资料](https://www.mips.com/products/architectures/mips32-2/)*  
----
## **项目进度**
#### *(2019.4.19)*
> 已完成`OR`指令的取指，译码和执行三个部分的流水线模块，并完成测试。 
#### *(2019.4.20)*
> 已完成`OR`指令的前四级流水线设计，尚未完成测试。  
#### *(2019.4.21)*
> 已完成`OR`指令五级流水线设计，并完成测试。  
#### *(2019.4.25)*
> 修改了原流水线结构，使其在第四个周期（访存）完成后可直接写寄存器，并解决了RAW（译码-回写）冲突。 
----
## **五级流水线时序图**
#### 顶层时序
>![顶层时序](https://github.com/bjwang964/MIPS/blob/master/Picture/five-pipeline.png)
#### 取指模块
>![取指模块](https://github.com/bjwang964/MIPS/blob/master/Picture/Instr_Fetch.PNG)
#### 译码模块
>![译码模块](https://github.com/bjwang964/MIPS/blob/master/Picture/Instr_Decode.PNG)
#### 执行模块
>![执行模块](https://github.com/bjwang964/MIPS/blob/master/Picture/Instr_Execute.PNG)
#### 访存模块
>![访存模块](https://github.com/bjwang964/MIPS/blob/master/Picture/Instr_Mem.PNG)
#### 写回模块
>![写回模块](https://github.com/bjwang964/MIPS/blob/master/Picture/Instr_WB.PNG)