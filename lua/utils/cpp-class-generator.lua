local function generate_cpp_class()
  local class_name = vim.fn.input("Class name: ")
  if class_name == "" then
    print("Error: no class given")
    return
  end

  local header_guard = class_name:upper() .. "_HPP"
  local class_template = string.format(
    [[
#ifndef %s
    #define %s
    
#include <iostream>

class %s {
    public:
        %s();
        ~%s() = default;
    private:
    protected:
};

#endif /* %s */
]],
    header_guard,
    header_guard,
    class_name,
    class_name,
    class_name,
    header_guard
  )
  vim.api.nvim_buf_set_lines(0, -1, -1, false, vim.split(class_template, "\n"))
  print("Class created" .. class_name)
end

vim.api.nvim_create_user_command("CreateClass", generate_cpp_class, {})
