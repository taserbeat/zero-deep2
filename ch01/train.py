# coding: utf-8
import sys  # noqa
sys.path.append('..')  # noqa

from common.optimizer import SGD  # noqa
from common.trainer import Trainer  # noqa
from dataset import spiral  # noqa
from two_layer_net import TwoLayerNet  # noqa


# ハイパーパラメータの設定
max_epoch = 300
batch_size = 30
hidden_size = 10
learning_rate = 1.0

x, t = spiral.load_data()
model = TwoLayerNet(input_size=2, hidden_size=hidden_size, output_size=3)
optimizer = SGD(lr=learning_rate)

trainer = Trainer(model, optimizer)
trainer.fit(x, t, max_epoch, batch_size, eval_interval=10)
trainer.plot()
