# frozen_string_literal: true

class CodeMode < ActiveHash::Base
  self.data = [
    { id: :plain_text, label: "Plain Text", brace: :plain_text, rouge: :plain_text },
    { id: :c_cpp,      label: "C",          brace: :c_cpp,      rouge: :c },
    { id: :javascript, label: "JavaScript", brace: :javascript, rouge: :javascript },
    { id: :html,       label: "HTML",       brace: :html,       rouge: :html },
    { id: :css,        label: "CSS",        brace: :css,        rouge: :css },
    { id: :scss,       label: "SCSS",       brace: :scss,       rouge: :scss },
    { id: :php,        label: "PHP",        brace: :php,        rouge: :php },
    { id: :python,     label: "Python",     brace: :python,     rouge: :python },
    { id: :ruby,       label: "Ruby",       brace: :ruby,       rouge: :ruby },
    { id: :sql,        label: "SQL",        brace: :sql,        rouge: :s_q_l },
    { id: :sh,         label: "Shell",      brace: :sh,         rouge: :shell },
  ]
end
