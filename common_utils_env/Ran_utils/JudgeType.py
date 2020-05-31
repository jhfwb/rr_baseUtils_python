# 判断类型
import re
class RR_JudgeType:
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


