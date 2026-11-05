{
  fetchurl,
  lib,
  runCommand,
}:

let
  modelRevision = "e9f90e488c1dc41997b5806537be7c43addca850";
  baseUrl = "https://huggingface.co/afirelily/phonop2c_v2_2_base_w8a8_model/resolve/${modelRevision}";

  fetchModelFile =
    modelPath: hash:
    fetchurl {
      name = "phono-model-${builtins.replaceStrings [ "/" ] [ "-" ] modelPath}";
      url = "${baseUrl}/${modelPath}";
      inherit hash;
    };

  config = fetchModelFile "config.json" "sha256-YMO9nmZhb36MW3gZT6ab61rKJQSjTnCkrU4ebj0wg6I=";
  preModel = fetchModelFile "bins/pre_model.pte" "sha256-zQAwIr4diqGX3RV+7wGimusn1ddT42Or98yHEjJ6KcQ=";
  postModel = fetchModelFile "bins/post_model.pte" "sha256-RGyVnRHBRYxc7yin530eiyT54lfvSE39q1iIxgL0ZiI=";
  segmentModel = fetchModelFile "bins/pinyin_segment.pte" "sha256-PWsKg7riVoaWD8D1w8/T7UvhMPtz60ksJKDwjkf+NVU=";
  modelOps = fetchModelFile "ops_config/model_ops.yaml" "sha256-NjPWkVY0uuCRtF6eLu6ii3JEf+HofOI0iT5Pm5nS1cw=";
  preModelOps = fetchModelFile "ops_config/pre_model_ops.yaml" "sha256-6Mt5JYwrJppevwSA8FSuozzcu3Ky8LfvZTcIZ4tg0d8=";
  postModelOps = fetchModelFile "ops_config/post_model_ops.yaml" "sha256-x4cHiXoIwH4ckm16SIEVR4diuflVI9mUDymwzosVN04=";
  segmentModelOps = fetchModelFile "ops_config/pinyin_segment_ops.yaml" "sha256-pHRUgDzjzLp3XLUFGcrqoJygVPBY2hrGGCqjXtN5U94=";
  chineseVocab = fetchModelFile "vocabs/chinese_vocab.txt" "sha256-Zo9p6FbDVxV3IKtab4ZE3KiiU7Q5dy+SzXYrGGpTtCE=";
  contextVocab = fetchModelFile "vocabs/context_vocab.txt" "sha256-2fFHBWbWzUFikplBTl/Mm8D+ZWaXjIjH1ahqZSC0oUM=";
  pinyinCharVocab = fetchModelFile "vocabs/pinyin_char_vocab.txt" "sha256-jFtB1mSCilH5UxwuCHd+fasoEADP64kvIcxU5s4A04s=";
  pinyinVocab = fetchModelFile "vocabs/pinyin_vocab.txt" "sha256-EomiMteDxz4WQzqfR09JKnKjIcqtevULHFdLk1fUMnk=";
in
runCommand "phonop2c-v2.2-base-w8a8-2026-10-28"
  {
    passthru = {
      inherit modelRevision;
    };

    meta = {
      description = "PhonoP2C v2.2 W8A8 model package for Phono";
      homepage = "https://huggingface.co/afirelily/phonop2c_v2_2_base_w8a8_model";
      platforms = lib.platforms.all;
    };
  }
  ''
    mkdir -p "$out/bins" "$out/ops_config" "$out/vocabs"
    cp ${config} "$out/config.json"
    cp ${preModel} "$out/bins/pre_model.pte"
    cp ${postModel} "$out/bins/post_model.pte"
    cp ${segmentModel} "$out/bins/pinyin_segment.pte"
    cp ${modelOps} "$out/ops_config/model_ops.yaml"
    cp ${preModelOps} "$out/ops_config/pre_model_ops.yaml"
    cp ${postModelOps} "$out/ops_config/post_model_ops.yaml"
    cp ${segmentModelOps} "$out/ops_config/pinyin_segment_ops.yaml"
    cp ${chineseVocab} "$out/vocabs/chinese_vocab.txt"
    cp ${contextVocab} "$out/vocabs/context_vocab.txt"
    cp ${pinyinCharVocab} "$out/vocabs/pinyin_char_vocab.txt"
    cp ${pinyinVocab} "$out/vocabs/pinyin_vocab.txt"
  ''
