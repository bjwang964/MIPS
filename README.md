![](https://img.shields.io/badge/master-bjwang964-blue.svg
)  ![](https://img.shields.io/badge/compilation-catandmore-brightgreen.svg)

## **项目目标**
>1.该项目将实现一个基于`MIPS`指令集架构的32位CPU模型，设计将有5级流水线以及IO接口。该项目最终将在Xilinx的FPGA开发板上测试并使用。  
>2.在硬件设计与验证完成后，将在其上移植一款已有的32位开源操作系统。  
---- 
## **项目目的**
>1.该项目旨在通过实践设计CPU，将数字电路、模拟电路、计算机组成原理、操作系统、计算机网络、微机原理与接口技术、嵌入式系统设计的理论知识与实际相结合，来深入理解计算机的组成结构以及工作原理。  
>2.通过该项目，学习并练习Verilog语言的开发方法，Vivado环境的使用以及FPGA平台的基本开发方法。 
----
## **参考资料**
>*1.《自己动手写CPU》 雷思磊著，电子工业出版社*  
>*2.《数字设计和计算机体系结构》 David Money Harris等著， 机械工业出版社*  
>*3.[MIPS官方参考资料](https://www.mips.com/products/architectures/mips32-2/)*  
----
## **项目进度**
#### *2019.4.19*
> 已完成`ORI`指令的取指，译码和执行三个部分的流水线模块，并完成测试。 
#### *2019.4.20*
> 已完成`ORI`指令的前四级流水线设计，尚未完成测试。  
#### *2019.4.21*
> 已完成`ORI`指令五级流水线设计，并完成测试。  
#### *2019.4.25*
>* 修改了原流水线结构，使其在第四个周期（访存）完成后可直接写寄存器。  
>* 解决了RAW（译码-回写）冲突。 
#### *2019.4.26*
> 增加了数据旁路，实现数据前推，解决一部分指令的RAW冲突。
#### *2019.4.27*
> 添加了`ANDI`, `XORI`, `AND`, `OR`, `XOR`, `NOR`, `LUI`, `SLL`, `SLLV`, `SRA`, `SRAV`, `SRL`, `SRLV`指令,但算术移位运算(`SRA`, `SRAV`)功能不完整。
#### *2019.5.5*
>* 增加了HI与LO两个特殊寄存器。
>* 添加了六条移动操作指令`MOVN`, `MOVZ`, `MFHI`, `MFLO`, `MTHI`, `MTLO`（未测试）。
#### *2019.5.6*
>完成了移动操作指令的测试。
#### *2019.5.13*
>  添加了`ADDU`,`ADD`,`SUB`,`SUBU`,`SLT`,`SLTU`,`ADDI`,`ADDIU`,`SLTI`,`SLTIU`,`CLO`,`CLZ`,等算术运算指令(未测试)。
----
## **五级流水线时序图**
#### 顶层时序
>![顶层时序](https://github.com/bjwang964/MIPS/blob/master/Picture/five-pipeline.png)
#### 取指模块
>![取指模块](https://github.com/bjwang964/MIPS/blob/master/Picture/Instr_Fetch.PNG)
#### 译码模块
>![译码模块](https://github.com/bjwang964/MIPS/blob/master/Picture/Instr_Decode.PNG)
>>译码器：![译码器](https://github.com/bjwang964/MIPS/blob/master/Picture/Instr_Decode_Decoder.PNG)
>>寄存器组：![寄存器组](https://github.com/bjwang964/MIPS/blob/master/Picture/Instr_Decode_Regsiters.PNG)
#### 执行模块
>![执行模块](https://github.com/bjwang964/MIPS/blob/master/Picture/Instr_Execute.PNG)
>>运算器：![运算器](https://github.com/bjwang964/MIPS/blob/master/Picture/Instr_Execute_EX.PNG)
#### 访存模块
>![访存模块](https://github.com/bjwang964/MIPS/blob/master/Picture/Instr_Mem.PNG)
#### 写回模块
>![写回模块](https://github.com/bjwang964/MIPS/blob/master/Picture/Instr_WB.PNG)