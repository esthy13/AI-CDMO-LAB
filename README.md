# AI-CDMO-LAB
Repository containing practical exercises for the course **Combinatorial Optimization and Decision Making (CDMO)**, academic year 2024/2025, **Master’s Degree in Artificial Intelligence, University of Bologna

___

## How to use run MiniZinc in Jupyter Notebooks

### 1. Install MiniZinc

Download and install **MiniZinc** from the official website:  
[https://www.minizinc.org/software.html](https://www.minizinc.org/software.html)  

Select the correct version for your operating system (Windows, macOS, or Linux).  

### 3. Configure the PATH Environment Variable

To use MiniZinc from the terminal or within Jupyter, you need to ensure that its executable is included in your system’s PATH environment variables. For guidance on setting or modifying the PATH, refer to this website:
[](https://www.java.com/en/download/help/path.html)

### 3. Install the correct IPython package in the Jupyter kernel

To ensure compatibility with Minizinc notebooks Make sure you have IPython version `8.12.3` in the kernel used by the Jupyter Notebooks:

pip install "ipython==8.12.3"


### 4. Install the official Python package for MiniZinc:
```
pip install minizinc
pip install -U iminizinc
```

