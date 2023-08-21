--Author : Administrator
--Date   : 2014/11/25

--[[
Now at that time, Judah went away from his brothers and became the friend of a man of Adullam named Hirah.
And there he saw the daughter of a certain man of Canaan named Shua, and took her as his wife.
And she gave birth to a son, and he gave him the name Er.
And again she gave birth to a son, and he gave him the name Onan.
Then she had another son, to whom she gave the name Shelah; she was at Chezib when the birth took place.
And Judah took a wife for his first son Er, and her name was Tamar.
Now Er, Judah's first son, did evil in the eyes of the Lord, so that he put him to death.
Then Judah said to Onan, Go in to your brother's wife and do what it is right for a husband's brother to do; make her your wife and get offspring for your brother.
But Onan, seeing that the offspring would not be his, went in to his brother's wife, but let his seed go on to the earth, so that he might not get offspring for his brother.
And what he did was evil in the eyes of the Lord, so that he put him to death, like his brother.
Then Judah said to Tamar, his daughter-in-law, Go back to your father's house and keep yourself as a widow till my son Shelah becomes a man: for he had in his mind the thought that death might come to him as it had come to his brothers. So Tamar went back to her father's house.
And after a time, Bath-shua, Judah's wife, came to her end; and after Judah was comforted for her loss, he went to Timnah, where they were cutting the wool of his sheep, and his friend Hirah of Adullam went with him.
And when Tamar had news that her father-in-law was going up to Timnah to the wool-cutting,
She took off her widow's clothing, and covering herself with her veil, she took her seat near Enaim on the road to Timnah; for she saw that Shelah was now a man, but she had not been made his wife.
--]]


--声明，这里声明了类名还有属性，并且给出了属性的初始值。
LuaClass = {x = 0, y = 0}

--这句是重定义元表的索引，就是说有了这句，这个才是一个类。
LuaClass.__index = LuaClass

--构造体，构造体的名字是随便起的，习惯性改为New()
function LuaClass:New(x, y) 
    local self = {};    --初始化self，如果没有这句，那么类所建立的对象改变，其他对象都会改变
    setmetatable(self, LuaClass);  --将self的元表设定为Class
    self.x = x;
    self.y = y;
    return self;    --返回自身
end

function LuaClass.AddThreeD(add1, add2, add3)
    local LongAdd = add1 + add2 + add3;
    if LongAdd > 255 then
        LongAdd = 0
    end
    
    return LongAdd;
end

function LuaClass.AddThree1(add1, add2, add3)
    local LongAdd = add1 + add2 + add3;
    if LongAdd > 255 then
        LongAdd = 0
    end
    
    return LongAdd;
end

--测试打印方法--
function LuaClass:test() 
    logWarn(string.Concat("x:>", self.x, " y:>", self.y));
end

--endregion

function LuaClass.AddThree2(add1, add2, add3)
    local LongAdd = add1 + add2 + add3;
    if LongAdd > 255 then
        LongAdd = 0
    end
    
    return LongAdd;
end
