
ParamValueMissing = -16777216;
debug = 0;


-- ***********************************************************************
--  FUNCTION : COUNT
-- ***********************************************************************
--  The function returns the number of the parameter which value is
--  not 'ParamValueMissing'.
-- ***********************************************************************

function COUNT(numOfParams,params)

  local cnt = 0;
  local result = {};
  
  for index, value in pairs(params) do
    if (value ~= ParamValueMissing) then
      cnt = cnt + 1;
    end
  end
  result.message = 'OK';
  result.value = cnt;
    
  return result.value,result.message;
  
end




-- ***********************************************************************
--  FUNCTION : VALID
-- ***********************************************************************
--  The function returns the first valid value in the list.
-- ***********************************************************************

function VALID(numOfParams,params)

  local result = {};
  
  if (numOfParams > 0) then   
    for index, value in pairs(params) do
      if (value ~= ParamValueMissing) then
        result.message = 'OK';
        result.value = value;
		return result.value,result.message;
      end
    end
    result.message = 'No valid value found!';
    result.value = ParamValueMissing;
  else
    result.message = 'No parameters given!';
    result.value = 0;  
  end
    
  return result.value,result.message;

end




-- ***********************************************************************
--  FUNCTION : getFunctionNames
-- ***********************************************************************
--  The function returns the list of available functions in this file.
--  In this way the query server knows which function are available in
--  each LUA file.
-- 
--  Each LUA file should contain this function. The 'type' parameter
--  indicates how the current LUA function is implemented.
--
--    Type 1 : 
--      Function takes two parameters as input:
--        - numOfParams => defines how many values is in the params array
--        - params      => Array of float values
--      Function returns two parameters:
--        - result value (function result or ParamValueMissing)
--        - result string (=> 'OK' or an error message)
--
--    Type 2 : 
--      Function takes three parameters as input:
--        - columns       => Number of the columns in the grid
--        - rows          => Number of the rows in the grid
--        - params        => Grid values (= Array of float values)
--      Function return one parameter:
--        - result array  => Array of float values (must have the same 
--                           number of values as the input 'params'.               
--
--    Type 3 : 
--      Function takes four parameters as input:
--        - columns       => Number of the columns in the grid
--        - rows          => Number of the rows in the grid
--        - params1       => Grid 1 values (= Array of float values)
--        - params2       => Grid 2 values (= Array of float values)
--      Function return one parameter:
--        - result array  => Array of float values (must have the same 
--                           number of values as the input 'params1'.               
--  
--    Type 4 : 
--      Function takes five parameters as input:
--        - columns       => Number of the columns in the grid
--        - rows          => Number of the rows in the grid
--        - params1       => Grid 1 values (= Array of float values)
--        - params2       => Grid 2 values (= Array of float values)
--        - params3       => Grid point angles to latlon-north (= Array of float values)
--      Function return one parameter:
--        - result array  => Array of float values (must have the same 
--                           number of values as the input 'params1'.
--      Can be use for example in order to calculate new Wind U- and V-
--      vectors when the input vectors point to grid-north instead of
--      latlon-north.               
--
--    Type 5 : 
--      Function takes three parameters as input:
--        - language    => defines the used language
--        - numOfParams => defines how many values is in the params array
--        - params      => Array of float values
--      Function return two parameters:
--        - result value (string)
--        - result string (=> 'OK' or an error message)
--      Can be use for example for translating a numeric value to a string
--      by using the given language.  
--  
--    Type 6 : 
--      Function takes two parameters as input:
--        - numOfParams => defines how many values is in the params array
--        - params      => Array of string values
--      Function return one parameters:
--        - result value (string)
--      This function takes an array of strings and returns a string. It
--      is used for example in order to get additional instructions for
--      complex interpolation operations.  
--  
-- ***********************************************************************

 
function getFunctionNames(type)

  local functionNames = '';

  if (type == 1) then 
    functionNames = 'COUNT,VALID';
  end
  
  return functionNames;

end

