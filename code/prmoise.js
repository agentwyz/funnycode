//记录promise的三种状态
const PENDING = "peddding";
const FULFILLED = "fulfilled";
const REJECTED = "rejected";

class MyPromise {
    constructor(executor) {
        this._state = PENDING;
        this._value = undefined;

        try {
            executor(this._resolve.bind(this), this._reject.bind(this));
        } catch (error) {
            this._reject(error);
        }
        
    }

    /*标记当前任务完成
        任务完成相关的数据
    */
    _resolve(data){
        //改变状态与数据
        this._changeState(FULFILLED, data);
    }
    
    /*标记当前任务失败
        任务失败的原因
    */
    _reject(reason){
        //改变状态与数据
        this._changeState(REJECTED, reason);
    }

    /*
    将改变状态这个东西抽离出来
    */
   _changeState(newState, value) {
        if (this._state !== PENDING) {
            return;
        }

        this._state = newState;
        this._value = value;
   }
}


function runMicroTask(callback) {
    //可以简单写一个setTimeOut()
    //setTimeout(callback, 0);

    //在node环境中, 将这个callback放到微队列
    if (process && process.nextTick) {
        process.nextTick(callback);
    }
    else {
        setTimeout(callback, 0);
    }
}

const p = new MyPromise((resolve, reject)=>{
    //window.re
    resolve(123);
    reject(123);
    throw 123;
});

console.log(p);