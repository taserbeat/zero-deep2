# coding: utf-8
import sys
sys.path.append('..')

from rnnlm import Rnnlm  # noqa
from better_rnnlm import BetterRnnlm  # noqa
from dataset import ptb  # noqa
from common.util import eval_perplexity  # noqa


if __name__ == '__main__':
    model = Rnnlm()
    # model = BetterRnnlm()

    # 学習済みのパラメータの読み込み
    model.load_params()

    corpus, _, _ = ptb.load_data('test')

    model.reset_state()
    ppl_test = eval_perplexity(model, corpus)
    print('test perplexity: ', ppl_test)
