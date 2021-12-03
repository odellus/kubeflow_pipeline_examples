import kfp
import kfp.comp as comp

client = kfp.Client(host='http://localhost:3000')

create_step_get_lines = comp.load_component_from_file('./get_lines_component.yaml')
create_step_write_lines = comp.load_component_from_file('./write_lines_component.yaml')

def my_pipeline():
     write_lines_step = create_step_write_lines(
         text='one\ntwo\nthree\nfour\nfive\nsix\nseven\neight\nnine\nten')
 
     get_lines_step = create_step_get_lines(
         # Input name "Input 1" is converted to pythonic parameter name "input_1"
         input_1=write_lines_step.outputs['data'],
         parameter_1='5',
     )
 
client.create_run_from_pipeline_func(my_pipeline, arguments={})
                                                        