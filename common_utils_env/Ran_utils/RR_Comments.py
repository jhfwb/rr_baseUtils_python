import sys
class PrintTool:
    """
    存放打印工具。
    """
    @staticmethod
    def print(s,fontColor='red',backgroundColor='white',displayWay=0,site=""):
        """
        默认字体为红色。背景色为白色
        能够按照颜色在控制台打印出来。可以自定义背景色和字体颜色。下划线等

        :param s:打印的内容
        :param fontColor: (str) red | green | yellow  | pink  | blue| gray | black
        :param backgroundColor: (str) red | green | yellow | blue  | black
        :param displayWay: (int) 0 普通模式 |
                                 1 字体加粗 |
                                 4 下划线 |
        :return: None
        """
        fontColorArr=[('red',31),('green',32),('yellow',33),('pink',35),('blue',34),('gray',37),('black',30)]
        backgroundColorArr=[('red',41),('green',42),('yellow',43),('blue',44),('black',40),('pink',45),('gray',47)]
        backgroundColorNUM = "init"
        fontColorNUM='init'
        for fontColor1 in fontColorArr:
            if fontColor1[0]==fontColor:
                fontColorNUM=fontColor1[1]
                break
        for backgroundColorArr1 in backgroundColorArr:
            if backgroundColorArr1[0]==backgroundColor:
                backgroundColorNUM = backgroundColorArr1[1]
                break
        if type(fontColorNUM)!=type(0) :
            raise ValueError("传入的fontColor有问题！找不到该字体颜色"+fontColor)
        if type(backgroundColorNUM)!=type(0) and backgroundColor!="white":
            raise ValueError("传入的backgroundColorNUM有问题！找不到该背景颜色" + backgroundColor)
        if displayWay==2:
            displayWay=4
        line="------------FILE:"+str(sys._getframe(1).f_code.co_filename)+"_____MODULE:"+str(sys._getframe(1).f_code.co_name)+"_____LINE:"+str(sys._getframe(1).f_lineno)
        if backgroundColor=="white":
            print('\033['+str(displayWay)+';' + str(fontColorNUM) + 'm', s,line)
        else:
            print('\033['+str(displayWay)+';'+str(fontColorNUM) + ';' + str(backgroundColorNUM) + 'm', s,line)
        print('\033[0m',end="")
        
class JudgeType:
    #判断类是什么类型
    #核心方法是type()
    #返回方法的名称
    #dict：字典类型
    @staticmethod
    def getType(obj):
        """
        判断类型：
        目前可以判断的类型如下：
            dict
            int
            str
            blo
            list
            method
            function
            module
            other：obj
        :param obj:
        :return:
        """
        if type(obj)==type({}):
           return "dict"
        if type(obj)==type(1):
           return "int"
        if type(obj)==type(""):
            return "str"
        if type(obj)==type(True):
            return "blo"
        if type(obj)==type([]):
            return "list"
        #if type(obj)==type():
        else:
            s = str(obj)
            if len(re.findall('<.*at.*>', s)) != 0:
                if len(re.findall('method', s)) != 0:
                    return 'method'
                elif len(re.findall('function', s)) != 0:
                    return 'function'
                elif len(re.findall('module', s)) != 0:
                    return 'module'
                else:
                    return 'obj'
        return None
if __name__ == '__main__':
    PrintTool.print("我很好")