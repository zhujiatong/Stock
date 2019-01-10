#!/usr/bin/env python
# coding: utf-8
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd
import time
import keras
import math
from sklearn import preprocessing
from keras.models import Sequential
from keras.layers.core import Dense, Dropout
from keras.layers.recurrent import LSTM, GRU

def load_data(stock, window, split=0.9):
    amount_of_features = len(stock.columns)
    data = stock.values
    sequence_length = window + 1
    result = []

    for index in range(len(data) - sequence_length):  # maxmimum date = lastest date - sequence length
        result.append(data[index: index + sequence_length])  # index : index + window

    result = np.array(result)
    row = int(split * result.shape[0])

    np.random.seed(101)
    row_shuffled = list(range(0, row))
    np.random.shuffle(row_shuffled)

    train = result[row_shuffled, :, :]
    X_train = train[:, :-1, :]
    Y_train = train[:, -1, :]

    test = result[row:, :, :]
    X_test = test[:, :-1, :]
    Y_test = test[:, -1, :]

    return [X_train, Y_train, X_test, Y_test]

def build_model(layers):
    model = Sequential()
    model.add(GRU(256, input_shape=(layers[1], layers[0]), return_sequences=True))
    model.add(Dropout(0.3))

    model.add(GRU(256, input_shape=(layers[1], layers[0]), return_sequences=False))
    model.add(Dropout(0.3))

    model.add(Dense(128, kernel_initializer="uniform", activation='relu'))
    model.add(Dense(layers[0], kernel_initializer="uniform", activation='linear'))

    #adam = keras.optimizers.Adam(decay=0.2)

    start = time.time()
    optimizer = keras.optimizers.adam(lr=0.001)
    model.compile(loss='mse', optimizer=optimizer, metrics=['accuracy'])
    print("Compilation Time : ", time.time() - start)
    return model

def model_score(model, X_train, y_train, X_test, y_test):
    trainScore = model.evaluate(X_train, y_train, verbose=0)
    print('Train Score: %.5f MSE (%.2f RMSE)' % (trainScore[0], math.sqrt(trainScore[0])))

    testScore = model.evaluate(X_test, y_test, verbose=0)
    print('Test Score: %.5f MSE (%.2f RMSE)' % (testScore[0], math.sqrt(testScore[0])))
    return trainScore[0], testScore[0]

df = pd.read_csv("nyse/prices-split-adjusted.csv", index_col = 0)
df["close"] = df.close # Moving close to the last column
print(df.shape)
df.head()

symbols = list(set(df.symbol))
print(len(symbols))

#stockSymbol="AMZN"
#df = df[df.symbol == stockSymbol]
#df.drop(['symbol'],1,inplace=True)
#print(df.shape)
#df.head()

plt.rcParams['font.sans-serif']=[u'SimHei']
plt.rcParams['axes.unicode_minus']=False

symbols=symbols[:1]

#遍历各支股票
for s in symbols:
    stockSymbol=s
    dfTmp = df[df.symbol == s]
    dfTmp.drop(['symbol'],1,inplace=True)
    # print(dfTmp.shape)
    # dfTmp.head()

    fig, ax = plt.subplots(1,2,figsize=(15,5))
    #绘制历史价格图
    ax[0].plot(dfTmp['open'].values.reshape(-1,1),label='开盘价')
    ax[0].plot(dfTmp['close'].values.reshape(-1,1),label='收盘价')
    ax[0].plot(dfTmp['low'].values.reshape(-1,1),label='最低价')
    ax[0].plot(dfTmp['high'].values.reshape(-1,1),label='最高价')
    ax[0].set_xlabel("时间/天")
    ax[0].set_ylabel("价格/美元")
    ax[0].set_title(stockSymbol+"历史价格")
    ax[0].legend(loc='upper left')

    axVlm=ax[0].twinx()
    axVlm.plot(dfTmp['volume'].values.reshape(-1,1),label='成交量',color='grey',linestyle='--')
    axVlm.set_ylabel("交易量/股")
    axVlm.legend(loc='upper right')

    dfTmp.drop(['volume'],1,inplace=True)
    dfTmp.head()

    scaler = preprocessing.MinMaxScaler()
    dfTmp = pd.DataFrame(scaler.fit_transform(dfTmp), columns=dfTmp.columns)
    dfTmp.head()

    window = 30
    X_train, y_train, X_test, y_test = load_data(dfTmp, window)
    #print('X',X_train[0])
    #print('y',y_train[0])

    model = build_model([dfTmp.shape[1],window])

    model.fit(X_train, y_train, batch_size=50, epochs=30, validation_split=0.1, verbose=1)

    #print('X_test', X_test.shape)
    y_pred = model.predict(X_test)
    #print('y_test', y_pred.shape)
    #绘制未来走势图
    ax[1].plot(scaler.inverse_transform(y_test.reshape(-1,y_test.shape[1])), label='y_test')
    ax[1].plot(scaler.inverse_transform(y_pred.reshape(-1,y_pred.shape[1])),label='y_pred')
    ax[1].set_xlabel("时间/天")
    ax[1].set_ylabel("价格/美元")
    ax[1].set_title(stockSymbol+"未来走势")
    plt.legend()
    plt.savefig("results/"+stockSymbol+".png")
    plt.show()

    #测试
    model_score(model, X_train, y_train, X_test, y_test)

