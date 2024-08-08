module timsort_module
  implicit none
  integer, parameter :: RUN = 32
  integer :: contador = 0

contains

  subroutine insertion_sort(arr, left, right)
    integer, intent(in) :: left, right
    integer, intent(inout) :: arr(:)
    integer :: i, j, key

    do i = left + 1, right
      key = arr(i)
      j = i - 1

      do while (j >= left .and. arr(j) > key)
        contador = contador + 1
        arr(j + 1) = arr(j)
        j = j - 1
      end do
      arr(j + 1) = key
    end do
  end subroutine insertion_sort

  subroutine merge(arr, temp, left, mid, right)
    integer, intent(in) :: left, mid, right
    integer, intent(inout) :: arr(:)
    integer, intent(inout) :: temp(:)
    integer :: i, j, k

    i = left
    j = mid + 1
    k = left

    do while (i <= mid .and. j <= right)
      contador = contador + 1
      if (arr(i) <= arr(j)) then
        temp(k) = arr(i)
        i = i + 1
      else
        temp(k) = arr(j)
        j = j + 1
      end if
      k = k + 1
    end do

    do while (i <= mid)
      temp(k) = arr(i)
      i = i + 1
      k = k + 1
    end do

    do while (j <= right)
      temp(k) = arr(j)
      j = j + 1
      k = k + 1
    end do

    arr(left:right) = temp(left:right)
  end subroutine merge

  subroutine timsort(arr, n)
    integer, intent(in) :: n
    integer, intent(inout) :: arr(:)
    integer, allocatable :: temp(:)
    integer :: i, size, left, mid, right

    allocate(temp(n))

    ! Ordenar bloques de tamaño RUN usando insertion sort
    do i = 1, n, RUN
      call insertion_sort(arr, i, min(i + RUN - 1, n))
    end do

    size = RUN
    do while (size < n)
      left = 1

      do while (left <= n - size)
        mid = left + size - 1
        right = min((left + 2 * size - 1), n)

        call merge(arr, temp, left, mid, right)
        left = left + 2 * size
      end do

      size = 2 * size
    end do

    deallocate(temp)
  end subroutine timsort

end module timsort_module

program test_timsort
  use timsort_module
  implicit none
  integer, parameter :: n = 1000000
  integer :: arr(n)
  real :: start_time, end_time

  real :: rand_vals(n)

  ! Inicializar el arreglo con valores enteros aleatorios
  call random_seed()
  call random_number(rand_vals)
  arr = int(rand_vals * 1000000)

  call cpu_time(start_time)
  call timsort(arr, n)
  call cpu_time(end_time)

  print *, "Array después de ordenar:"
  print *, arr(1:10)  ! Imprimir los primeros 10 elementos

  print *, "Tiempo de ejecución (segundos):", end_time - start_time

end program test_timsort
