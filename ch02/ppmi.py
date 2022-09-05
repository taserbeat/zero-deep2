# coding: utf-8
import sys  # noqa
sys.path.append('..')  # noqa

import numpy as np  # noqa
from common.util import preprocess, create_co_matrix, ppmi  # noqa


text = 'You say goodbye and I say hello.'
corpus, word_to_id, id_to_word = preprocess(text)
vocab_size = len(word_to_id)
C = create_co_matrix(corpus, vocab_size)
W = ppmi(C)

np.set_printoptions(precision=3)  # 有効桁３桁で表示
print('covariance matrix')
print(C)
print('-' * 50)
print('PPMI')
print(W)