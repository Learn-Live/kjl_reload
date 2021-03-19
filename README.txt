Recreate new models from saved paramters stored on the disk and evalute them on test sets.

#################################################################################################################
1. Instructions to run experiments and obtain results
    main_reload.sh: a shell script to run all experiments.

    $cd kjl/examples/
    $chmod 755 ./speedup/main_reload.sh
    $./speedup/main_reload.sh

    Note: the main_reload.sh uses python3.7.
          If Python version is not 3.7, please modify the main_reload.sh.

#################################################################################################################
2. Project structures
|-kjl: (root)
  |--examples
     |--speedup
         |--data: (all models and datasets)
         |--main_reload.sh (bash shell sript)
         |--main_reload_idv.py
         |--out: (results)

  |--kjl: (core codes)
     |--model: (includes all models)
  |--utils: (tools)


#################################################################################################################
3. Requried libraries
    Python==3.7.3

    # Can be installed by pip3
    pandas==0.25.1
    numpy==1.19.2
    scikit-learn==0.22.1
    func_timeout==4.3.5
