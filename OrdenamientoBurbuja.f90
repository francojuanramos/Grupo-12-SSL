program ordenamiento_de_burbuja
  implicit none
  integer, parameter :: cantidad = 10000
  integer :: i, j, aux
  integer :: vector(cantidad)
  real :: tiempo_inicial, tiempo_final
  real :: vector_real(cantidad)
  
  call random_seed()
  call random_number(vector_real)
  vector = int(vector_real * cantidad)
  
  call cpu_time(tiempo_inicial)  ! Inicia el cronómetro
  
  do i = 1, cantidad - 1
    do j = 1, cantidad - i
      if (vector(j) > vector(j+1)) then
        aux = vector(j)
        vector(j) = vector(j+1)
        vector(j+1) = aux
      end if
    end do
  end do
  
  call cpu_time(tiempo_final)  ! Detiene el cronómetro
  
  print *, 'El vector ordenado:'
  print *, vector(1:10)  ! Imprimir solo los primeros 10 elementos
  print *, 'Tiempo de ejecución (segundos):', tiempo_final - tiempo_inicial
  
end program ordenamiento_de_burbuja
